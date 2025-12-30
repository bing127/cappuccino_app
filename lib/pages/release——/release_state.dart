import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ReleaseState {
  RxInt currentIndex = 0.obs;
  // pageView 控制器
  late Rx<PageController> pageController;
  ReleaseState() {
    pageController = PageController(initialPage: 0, keepPage: true).obs;
  }
}
