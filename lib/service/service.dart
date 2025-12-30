import 'dart:io';

import 'package:camera/camera.dart';
import 'package:cappuccino/constants/keys.dart';
import 'package:cappuccino/routes/app_routes.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:cappuccino/utils/zh_cn_timeago.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cappuccino/utils/storage.dart';
import 'package:get/get.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import 'global_bindings.dart';

class Service {
  // 是否登录过，用于免登录
  static bool isLogin = false;
  static const String APP_NAME = "此刻";
  static const String SERVER_API_URL = "http://now.if4.ttyt.cc";
  // static const String SERVER_API_URL = "http://127.0.0.1:1208";
  static const String APP_THEME = 'dark';
  // 是否启用缓存
  static const bool CACHE_ENABLE = false;
  static late List<CameraDescription> cameras;

  static logout() {
    JSpUtil.clear();
    Get.offAllNamed(Routes.login);
  }

  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();
    GlobalBindings().dependencies();
    cameras =  await availableCameras();
    timeago.setLocaleMessages('zh_cn', ZhCnTimeAgo());
    AssetPicker.registerObserve();
    PhotoManager.setLog(true);

    /// 初始持久化数据
    await JSpUtil.getInstance();
    // 获取当前用户位置
    // await Utils.getLocation();

    String? accessToken = JSpUtil.getString(CachedLocalKeyDict.authorization);
    if (accessToken!.isNotEmpty) {
      isLogin = true;
    } else {
      isLogin = false;
    }

    // android 状态栏为透明的沉浸
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Color(0xffFAFAFA),
          statusBarIconBrightness: Brightness.dark);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }
}
