import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:cappuccino/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';

/// 文件工具类
class FileUtil {
  ///补全本地图片的路径
  static String wrapImageAssets(String path) {
    return imageLocalPath + path;
  }

  ///补全Json的路径
  static String wrapJsonAssets(String path) {
    return "$jsonLocalPath$path.json";
  }

  ///补全Json的路径
  static String wrapHTMLAssets(String path) {
    return "$htmlLocalPath$path.html";
  }

  ///读取本地的JSON 文件
  static Future<Map<String, dynamic>> loadAssetsJsonStr(
      BuildContext context, String fileName) async {
    String path = wrapJsonAssets(fileName);
    String jsonStr = await DefaultAssetBundle.of(context).loadString(path);
    Map<String, dynamic> json = jsonDecode(jsonStr);
    return json;
  }

  /// 用户保存文件的目录
  /// ios直接保存在[getApplicationDocumentsDirectory]
  /// 如果Android有[getExternalStorageDirectory]
  static get saveDataDir async {
    Directory? directory = await getApplicationDocumentsDirectory();
    if (Platform.isAndroid) {
      Directory? exDir = await getExternalStorageDirectory();
      if (exDir != null) {
        directory = exDir;
      }
    }
    return directory;
  }

  ///创建文件路径
  static createFilePath(folderName) async {
    Directory directory = await saveDataDir;
    String path = "${directory.path}${Platform.pathSeparator}$folderName";
  }

  ///文件转 Uint8List
  static file2Uint8List(File file) async {
    Uint8List imageBytes = await file.readAsBytes();
    return imageBytes;
  }

  /// unit8List 转base64
  static uint8List2Base64(Uint8List uint8list) {
    String base64 = base64Encode(uint8list);
    return base64;
  }

  ///图片转base64 无头
  ///[file] 文件
  ///[base64] String 类型的base64
  static file2Base64(File file) async {
    Uint8List imageBytes = await file2Uint8List(file);
    String base64 = base64Encode(imageBytes);
    return base64;
  }
  /// 将ByteData 转成 Uint8List
  /// [data] ByteData数据
  /// return [Uint8List] Uint8List
  static byteData2Uint8List(ByteData data) {
    return data.buffer.asUint8List();
  }

  static saveImage2Album(image, {quality = 100, name = "photo"}) async {
    final result =
    await ImageGallerySaver.saveImage(image, quality: quality, name: name);
    return result;
  }
}
