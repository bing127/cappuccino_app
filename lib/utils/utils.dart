import 'dart:convert';

import 'package:cappuccino/api/common_api.dart';
import 'package:cappuccino/bean/regeo_bean.dart';
import 'package:cappuccino/components/app_image/app_image.dart';
import 'package:cappuccino/constants/colors.dart';
import 'package:cappuccino/constants/keys.dart';
import 'package:cappuccino/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';

class CustomCacheManager {
  static const key = 'customCacheKey';
  static CacheManager instance = CacheManager(
    Config(
      key,
      stalePeriod: const Duration(days: 7),
      maxNrOfCacheObjects: 20,
      repo: JsonCacheInfoRepository(databaseName: key),
      fileService: HttpFileService(),
    ),
  );
}

class ScreenRECT {
  double width;
  double height;

  ScreenRECT({
    required this.width,
    required this.height,
  });
}

class Utils {
  static ScreenRECT getCurrentPageRECT(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ScreenRECT(width: size.width, height: size.height);
  }

  static String uuid() {
    return const Uuid().v4();
  }

  static String createMd5(String input) {
    return md5.convert(utf8.encode(input)).toString();
  }

  static String trimAll(String e) {
    return e.replaceAll(RegExp(r"\s+\b|\b\s"), "");
  }

  static String getQrCode(int id) {
    return id.toString().padLeft(12, '0');
  }

  static Future<RegeoBean> getLocation() async {
    var cachedData = JSpUtil.getJSON(CachedLocalKeyDict.userLocation);
    if(cachedData != null) {
      return RegeoBean.fromJson(cachedData);
    }
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('定位服务已禁用');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('位置权限被拒绝');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          '位置权限被永久拒绝');
    }
    var data = await Geolocator.getCurrentPosition();
    var locationData = await CommonApi.getUserLocation(data.longitude, data.latitude);
    JSpUtil.setJSON(CachedLocalKeyDict.userLocation, locationData);
    return locationData;
  }

  static int compareVersions(v1, v2) {
    List<int> v1parts =
        v1.toString().split('.').map((e) => int.parse(e)).toList();
    List<int> v2parts =
        v2.toString().split('.').map((e) => int.parse(e)).toList();

    for (var i = 0; i < v1parts.length; ++i) {
      if (v2parts.length == i) {
        return 1;
      }

      if (v1parts[i] == v2parts[i]) {
        continue;
      } else if (v1parts[i] > v2parts[i]) {
        return 1;
      } else {
        return -1;
      }
    }

    if (v1parts.length != v2parts.length) {
      return -1;
    }

    return 0;
  }

  static void setUI({Color? statusBarColor, bool fontIsDark = false}) {
    if (statusBarColor == null) {
      return;
    }
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: statusBarColor,
        statusBarIconBrightness:
            fontIsDark ? Brightness.dark : Brightness.light));
  }

  // 状态栏字体白色
  static const SystemUiOverlayStyle light = SystemUiOverlayStyle(
    statusBarColor: Colors.black,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.black,
    statusBarBrightness: Brightness.dark,
  );

  //  状态栏字体黑色
  static const SystemUiOverlayStyle dark = SystemUiOverlayStyle(
    statusBarColor: Colors.white,
    systemNavigationBarIconBrightness: Brightness.light,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: Colors.white,
    statusBarBrightness: Brightness.light,
  );

  // 缓存图片
  static Widget cachePicture(String picture, {double? width, double? height}) {
    AppImage image = AppImage(
      image: NetworkImage(picture),
      fit: BoxFit.cover,
      progress: true,
      color: BasicColor.mainColor.withOpacity(0.3),
    );
    return width != null
        ? SizedBox(
            width: width,
            height: height,
            child: image,
          )
        : image;
  }
}
