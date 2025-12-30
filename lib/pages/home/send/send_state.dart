import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendState {
  late Rx<ScrollController> scrollController = ScrollController().obs;
  late Rx<GlobalKey> appBarGlobalKey = GlobalKey().obs;
  late Rx<GlobalKey> menuGlobalKey = GlobalKey().obs;
  late RxDouble opacity = 0.0.obs;
  SendState() {
    ///Initialize variables
  }
}
