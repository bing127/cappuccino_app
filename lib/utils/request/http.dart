import 'dart:async';
import 'dart:io';

import 'package:cappuccino/api/account_api.dart';
import 'package:cappuccino/constants/keys.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:cappuccino/service/service.dart';
import 'package:cappuccino/utils/request/response.dart';
import 'package:cappuccino/utils/storage.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._internal();
  factory HttpUtil() => _instance;

  late Dio dio;
  CancelToken cancelToken = CancelToken();

  HttpUtil._internal() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = BaseOptions(
      // 请求基地址,可以包含子路径
      baseUrl: Service.SERVER_API_URL,
      // baseUrl: storage.read(key: STORAGE_KEY_APIURL) ?? SERVICE_API_BASEURL,
      //连接服务器超时时间，单位是秒.
      connectTimeout: const Duration(seconds: 60),
      // 响应流上前后两次接受到数据的间隔，单位为秒。
      receiveTimeout: const Duration(seconds: 60),
      // Http请求头.
      headers: {},
      /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
      /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
      /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]
      /// 就会自动编码请求体.
      contentType: 'application/json; charset=utf-8',
      /// [responseType] 表示期望以那种格式(方式)接受响应数据。
      /// 目前 [ResponseType] 接受三种类型 `JSON`, `STREAM`, `PLAIN`.
      ///
      /// 默认值是 `JSON`, 当响应头中content-type为"application/json"时，dio 会自动将响应内容转化为json对象。
      /// 如果想以二进制方式接受响应数据，如下载一个二进制文件，那么可以使用 `STREAM`.
      ///
      /// 如果想以文本(字符串)格式接收响应数据，请使用 `PLAIN`.
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    // Cookie管理
    CookieJar cookieJar = CookieJar();
    dio.interceptors.add(CookieManager(cookieJar));
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
    ));
    // 添加拦截器
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options); //continue
        // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
        // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
        // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
        // 这样请求将被中止并触发异常，上层catchError会被调用。
      },
      onResponse: (response, handler) {
        BaseResponse baseResponse = BaseResponse.fromJson(response.data);
        if(baseResponse.code == 401) {
          JSpUtil.clear();
          Service.logout();
          EasyLoading.dismiss();
        } else {
          return handler.next(response);
        }
      },
      onError: (DioException e, handler) async {
        int? errCode = e.response?.statusCode;
        if(errCode == 401) {
          await AccountApi.refreshUserToken();
          await dio.fetch(e.requestOptions);
        } else {
          return handler.next(e); //continue
        }
      },
    ));
  }

  /*
   * error统一处理
   */
  // 错误信息
  ErrorEntity createErrorEntity(DioException error) {
    switch (error.type) {
      case DioExceptionType.cancel:
        return ErrorEntity(code: -1, message: "请求取消");
      case DioExceptionType.connectionTimeout:
        return ErrorEntity(code: -1, message: "连接超时");
      case DioExceptionType.sendTimeout:
        return ErrorEntity(code: -1, message: "请求超时");
      case DioExceptionType.receiveTimeout:
        return ErrorEntity(code: -1, message: "响应超时");
      case DioExceptionType.badResponse:
        {
          try {
            int? errCode = error.response?.statusCode;
            switch (errCode) {
              case 400:
                return ErrorEntity(code: errCode, message: "请求语法错误");
              case 401:
                return ErrorEntity(code: errCode, message: "没有权限");
              case 402:
                return ErrorEntity(code: errCode, message: "请登录系统再操作");
              case 403:
                return ErrorEntity(code: errCode, message: "服务器拒绝执行");
              case 404:
                return ErrorEntity(code: errCode, message: "无法连接服务器");
              case 405:
                return ErrorEntity(code: errCode, message: "请求方法被禁止");
              case 500:
                return ErrorEntity(code: errCode, message: "服务器内部错误");
              case 502:
                return ErrorEntity(code: errCode, message: "无效的请求");
              case 503:
                return ErrorEntity(code: errCode, message: "服务器挂了");
              case 505:
                return ErrorEntity(code: errCode, message: "不支持HTTP协议请求");
              default:
                {
                  return ErrorEntity(
                    code: errCode,
                    message: error.response?.statusMessage,
                  );
                }
            }
          } on Exception catch (_) {
            return ErrorEntity(code: -1, message: "未知错误");
          }
        }
      default:
        {
          return ErrorEntity(code: -1, message: error.message);
        }
    }
  }

  /*
   * 取消请求
   *
   * 同一个cancel token 可以用于多个请求，当一个cancel token取消时，所有使用该cancel token的请求都会被取消。
   * 所以参数可选
   */
  void cancelRequests(CancelToken token) {
    token.cancel("cancelled");
  }

  /// 读取本地配置
  Map<String, dynamic>? getAuthorizationHeader() {
    Map<String, String>? headers;
    String? accessToken = JSpUtil.getString(CachedLocalKeyDict.authorization);
    if (accessToken != null) {
      headers = {
        'Access-Token': accessToken,
      };
    }
    return headers;
  }

  /// restful get 操作
  /// refresh 是否下拉刷新 默认 false
  /// noCache 是否不缓存 默认 true
  /// list 是否列表 默认 false
  /// cacheKey 缓存key
  /// cacheDisk 是否磁盘缓存
  Future get(
      String path, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        bool refresh = false,
        bool noCache = !Service.CACHE_ENABLE,
        bool list = false,
        bool loading = false,
        String cacheKey = '',
        bool cacheDisk = false,
      }) async {
    Options requestOptions = options ?? Options();
    requestOptions.extra ??= {};
    requestOptions.extra!.addAll({
      "refresh": refresh,
      "noCache": noCache,
      "list": list,
      "cacheKey": cacheKey,
      "cacheDisk": cacheDisk,
    });
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    if(loading) {
      EasyLoading.show();
    }
    var response = await dio.get(
      path,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    ).whenComplete(() {
      if(loading) {
        EasyLoading.dismiss();
      }
    });
    return BaseResponse.fromJson(response.data);
  }

  /// restful post 操作
  Future post(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        bool loading = false,
        Options? options,
      }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {
      'Content-Type': 'application/json;charset=UTF-8'
    };
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    if(loading) {
      EasyLoading.show();
    }
    var response = await dio.post(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    ).whenComplete(() {
      if(loading) {
        EasyLoading.dismiss();
      }
    });
    return BaseResponse.fromJson(response.data);
  }

  /// restful put 操作
  Future put(
      String path, {
        dynamic data,
        bool loading = false,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    if(loading) {
      EasyLoading.show();
    }
    var response = await dio.put(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    ).whenComplete(() {
      if(loading) {
        EasyLoading.dismiss();
      }
    });
    return BaseResponse.fromJson(response.data);
  }

  /// restful patch 操作
  Future patch(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.patch(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return BaseResponse.fromJson(response.data);
  }

  /// restful delete 操作
  Future delete(
      String path, {
        dynamic data,
        bool loading = false,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    if(loading) {
      EasyLoading.show();
    }
    var response = await dio.delete(
      path,
      data: data,
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    ).whenComplete(() {
      if(loading) {
        EasyLoading.dismiss();
      }
    });
    return BaseResponse.fromJson(response.data);
  }

  /// restful post form 表单提交操作
  Future postForm(
      String path, {
        dynamic data,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    var response = await dio.post(
      path,
      data: FormData.fromMap(data),
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return BaseResponse.fromJson(response.data);
  }

  /// restful post Stream 流数据
  Future postStream(
      String path, {
        dynamic data,
        int dataLength = 0,
        Map<String, dynamic>? queryParameters,
        Options? options,
      }) async {
    Options requestOptions = options ?? Options();
    requestOptions.headers = requestOptions.headers ?? {};
    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if (authorization != null) {
      requestOptions.headers!.addAll(authorization);
    }
    requestOptions.headers!.addAll({
      Headers.contentLengthHeader: dataLength.toString(),
    });
    var response = await dio.post(
      path,
      data: Stream.fromIterable(data.map((e) => [e])),
      queryParameters: queryParameters,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return BaseResponse.fromJson(response.data);
  }
}

// 异常处理
class ErrorEntity implements Exception {
  int? code;
  String? message;
  ErrorEntity({this.code, this.message});

  @override
  String toString() {
    if (message == null) return "Exception";
    return "Exception: code $code, $message";
  }
}
