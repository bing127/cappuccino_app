
import 'package:cappuccino/bean/user_info_bean.dart';
import 'package:cappuccino/pages/frame/frame_logic.dart';
import 'package:cappuccino/pages/frame/frame_state.dart';
import 'package:cappuccino/service/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'my_state.dart';

class MyLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final MyState state = MyState();
  late Rx<TabController> tabController;

  @override
  void onInit() {
    tabController = TabController(length: 3, vsync: this).obs;
    super.onInit();
  }

  void logout() {
    Service.logout();
  }

  void setOpen(bool open) {
    Get.find<FrameLogic>().state.drawerType.value = DrawerType.my;
  }

  void updateInfo(UserInfoBean infoBean) {
    state.userInfo.value = infoBean;
    update();
  }

  @override
  void onReady() {
    _onScroll();
    state.userInfo.value = Get.find<FrameLogic>().state.userInfo.value;
   super.onReady();
  }


  void _onScroll() {
    state.scrollController.value.addListener(() {
      final RenderBox? renderBox = state.tabBarGlobalKey.value.currentContext?.findRenderObject() as RenderBox?;
      Offset? offset = renderBox?.localToGlobal(Offset.zero);
      final appBarHeight = kToolbarHeight + Get.mediaQuery.padding.top;
      double scale = appBarHeight / offset!.dy;
      if(scale > 0.3 && scale<= 1.0) {
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
