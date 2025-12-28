import 'package:cappuccino/constants/login_constants.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class OtherLoginState {
  final Rx<TextEditingController> loginName = TextEditingController().obs;
  final Rx<TextEditingController> password = TextEditingController().obs;
  final Rx<LoginConstants> loginType = LoginConstants.password.obs;
  final RxBool showPassword = false.obs;
  OtherLoginState() {
    ///Initialize variables
  }
}
