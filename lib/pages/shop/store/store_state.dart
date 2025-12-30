import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreState {
  late Rx<ScrollController> scrollController = ScrollController().obs;
  late Rx<GlobalKey> tabBarGlobalKey = GlobalKey().obs;
  late Rx<GlobalKey> appBarGlobalKey = GlobalKey().obs;
  late RxDouble opacity = 0.0.obs;
  late RxBool isScroll = false.obs;
  StoreState() {
    ///Initialize variables
  }
}
