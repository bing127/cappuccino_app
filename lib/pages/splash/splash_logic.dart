import 'dart:async';

import 'package:cappuccino/routes/app_routes.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'splash_state.dart';

class SplashLogic extends GetxController {
  final SplashState state = SplashState();
  late Timer timer;

  @override
  void onInit() {
    SystemChrome.setSystemUIOverlayStyle(Utils.light);
    super.onInit();
  }

  @override
  void onReady() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        if(state.secondsRemaining.value > 1) {
          state.secondsRemaining.value --;
        } else {
          goToHome();
        }
    });
    super.onReady();
  }

  @override
  void onClose() {
    timer.cancel();
    super.onClose();
  }

  void goToHome() {
    timer.cancel();
    SystemChrome.setSystemUIOverlayStyle(Utils.dark);
    Future.delayed(const Duration(milliseconds: 50), () {
      Get.offAndToNamed(Routes.frame);
    });
  }
}
