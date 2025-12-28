import 'package:cappuccino/pages/frame/frame_logic.dart';
import 'package:cappuccino/pages/frame/frame_state.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_state.dart';

class HomeLogic extends GetxController with GetTickerProviderStateMixin {
  final HomeState state = HomeState();
  late Rx<TabController> tabController;
  late Rx<TabController> findTabController;

  @override
  void onInit() {
    super.onInit();
    getLocation();
    tabController = TabController(length: 3, vsync: this).obs;
    tabController.value.index = 1;
    findTabController = TabController(length: 9, vsync: this).obs;
  }

  void getLocation() {
    Utils.getLocation().then((value) {
      state.location.value = value.regeocode?.addressComponent?.city ?? "附近";
    });
  }

  void setOpen(bool open) {
    Get.find<FrameLogic>().state.drawerType.value = DrawerType.home;
  }
}
