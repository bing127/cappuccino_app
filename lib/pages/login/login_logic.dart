import 'dart:async';

import 'package:cappuccino/routes/app_routes.dart';
import 'package:cappuccino/utils/storage.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

import 'login_state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void goToHome() {
    showToast("登录成功", duration: const Duration(milliseconds: 800));
    JSpUtil.setString('Authorization', 'Cappuccino123');
    Future.delayed(const Duration(seconds: 1), () => {
      Get.offAndToNamed(Routes.frame)
    });
  }
}
