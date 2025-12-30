import 'package:cappuccino/bean/user_info_bean.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyState {
  late Rx<ScrollController> scrollController = ScrollController().obs;
  late Rx<GlobalKey> tabBarGlobalKey = GlobalKey().obs;
  late Rx<UserInfoBean> userInfo = UserInfoBean().obs;
  late Rx<GlobalKey> appBarGlobalKey = GlobalKey().obs;
  late RxDouble opacity = 0.0.obs;
  MyState() {
    ///Initialize variables
  }
}
