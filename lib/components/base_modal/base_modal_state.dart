import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class BaseModalState {
  late RxBool isShow = false.obs;
  late Rx<AnimationController> animationController;
  BaseModalState() {
    ///Initialize variables
  }
}
