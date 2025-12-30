import 'package:cappuccino/bean/city_bean.dart';
import 'package:cappuccino/bean/regeo_bean.dart';
import 'package:cappuccino/bean/user_place_bean.dart';
import 'package:cappuccino/utils/request/http.dart';
import 'package:cappuccino/utils/request/response.dart';
import 'package:cappuccino/utils/request/utils.dart';
import 'package:dio/dio.dart';

class CommonApi {
   static Future<RegeoBean> getUserLocation(double longitude, double latitude) async {
    var res = await HttpUtil().get('/api/v1/public/regeo', queryParameters: <String,double>{
       'longitude': longitude,
       'latitude': latitude,
     });
     return RegeoBean.fromJson(res.data);
   }
   static Future<List<CityBean>?> getCity(String province, String city, String area) async {
     var res = await HttpUtil().get('/api/v1/public/city', queryParameters: <String,String>{
       'province': province,
       'city': city,
       'area': area,
     }, loading: true);

     return ResponseUtils(data: res.data).getTypedList((map) => CityBean.fromJson(map as Map<String, dynamic>));
   }

   static Future<List<UserPlaceBean>?> get_api_v1_public_place(double longitude, double latitude) async {
     var res = await HttpUtil().get('/api/v1/public/place', queryParameters: <String,double?>{
       'longitude': longitude,
       'latitude': latitude,
     }, loading: false);
     return ResponseUtils(data: res.data['pois']).getTypedList((map) => UserPlaceBean.fromJson(map as Map<String, dynamic>));
   }

   // 上传文件
   static Future<BaseResponse?> uploadFile(String localImagePath) async {
     Map<String ,dynamic> map = {};
     map['file'] = await MultipartFile.fromFile(localImagePath);
     FormData formData = FormData.fromMap(map);
     var res = await HttpUtil().post('/api/v1/auth/common_auth/upload', data: formData, loading: true, options: Options(
       headers: {
         'Content-Type': 'multipart/form-data'
       }
     ));
     return res;
   }
}