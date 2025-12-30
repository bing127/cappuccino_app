import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'base_modal_state.dart';

class BaseModalLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final BaseModalState state = BaseModalState();

  @override
  void onInit() {
    state.isShow.value = true;
    state.animationController = AnimationController(
      duration: const Duration(milliseconds: 160),
      vsync: this,
    ).obs;

    super.onInit();
  }

  @override
  void onReady() {
    state.animationController.value.forward();
    super.onReady();
  }

  @override
  void dispose() {
    state.animationController.value.dispose();
      super.dispose();
  }
}
