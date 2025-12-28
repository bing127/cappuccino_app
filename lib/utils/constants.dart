import 'package:flutter/material.dart';

enum LinkType {
    cases,
    customer,
    none,
}

///一些枚举和常量的定义
///页面状态
enum ViewState {
    idle, //空闲的(执行完毕)
    error, //出错了
    empty, //返回空值
    busy, //繁忙的
}

///页面错误类型
enum StateErrorType {
    defaultError,
    networkTimeoutError, //网络错误
    unauthorizedError, //授权错误
    responseException, //响应异常
}
enum ImageFrom{
    camera,
    gallery
}

///大小单位
List sizeUnit = ["B", "KB", "MB", "GB", "TB", "PB"];

///设计尺寸
Size designSize = const Size(375, 812);

///图片大小列表
enum PhotoSizeList {
    oneInch, //一寸相片
    idCardHead, //身份证大头贴
    twoInch, //两寸照片
    smallTwoInch, //小两寸
}

/// 图片大小详情
List photoSizeInfo = [
    "1寸 2.5*3.5cm 413*295",
    "身份证大头照 3.3*2.2cm 390*260",
    "2寸  3.5*5.3cm 626*413",
    "小2寸（护照） 4.8*3.3cm 567*390"
];
/// 图片本地路径
const String imageLocalPath = "assets/images/";

///json的本地路径
const String jsonLocalPath = "assets/json/";

///本地网页的路径
const String htmlLocalPath = "assets/html/";

const String clientId="这里写你的百度云API KEY";
const String clientSecret="这里写你的百度云Secret KEY";



class Constants {
    static const int color = 0xfff8c272;
    static const Color colorObject = Color(0xfff8c272);
    static const Color bgColor = Color(0xfff0f1f5);
    static const Color greyColor = Color(0xff8a97a0);
    static const Color dangerColor = Color(0xffe41d30);
}