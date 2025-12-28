import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'send_state.dart';

class SendLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final SendState state = SendState();
  late Rx<TabController> tabController;

  @override
  void onInit() {
    tabController = TabController(length: 9, vsync: this).obs;
    super.onInit();
  }

  @override
  void onReady() {
    _onScroll();
    super.onReady();
  }
  void _onScroll() {
    final RenderBox? appBarRenderBox = state.appBarGlobalKey.value.currentContext?.findRenderObject() as RenderBox?;
    final appBarHeight = appBarRenderBox!.size.height + Get.mediaQuery.padding.top;
    final RenderBox? renderBox = state.menuGlobalKey.value.currentContext?.findRenderObject() as RenderBox?;
    state.scrollController.value.addListener(() {
      Offset? offset = renderBox?.localToGlobal(Offset.zero);
      double scale = appBarHeight / offset!.dy;
      if(scale > 0.85 && scale <= 1.0) {
        state.opacity.value = scale;
      } else {
          if(scale > 1.0) {
            state.opacity.value = 1.0;
          }
          if(scale < 0.85) {
            state.opacity.value = 0.0;
          }
      }
    });
  }

  @override
  void dispose() {
    state.scrollController.value.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
