import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'store_state.dart';

class StoreLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final StoreState state = StoreState();
  late Rx<TabController> tabController;

  @override
  void onInit() {
    tabController = TabController(length: 4, vsync: this).obs;
    super.onInit();
  }

  @override
  void onReady() {
    _onScroll();
    super.onReady();
  }


  void _onScroll() {
    state.scrollController.value.addListener(() {
      final RenderBox? renderBox = state.tabBarGlobalKey.value.currentContext?.findRenderObject() as RenderBox?;
      Offset? offset = renderBox?.localToGlobal(Offset.zero);
      final appBarHeight = kToolbarHeight + Get.mediaQuery.padding.top;
      double scale = appBarHeight / offset!.dy;

      if(scale > 0.5 && scale<= 1.0) {
        state.opacity.value = scale;
      } else {
        if(scale > 1.0) {
          state.opacity.value = 1.0;
        } else {
          state.opacity.value = 0.0;
        }
      }
    });
  }

  @override
  void dispose() {
    tabController.value.dispose();
    state.scrollController.value.dispose();
    super.dispose();
  }
}