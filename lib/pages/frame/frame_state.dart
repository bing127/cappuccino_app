import 'package:cappuccino/bean/user_info_bean.dart';
import 'package:cappuccino/bean/user_place_bean.dart';
import 'package:cappuccino/pages/frame/tab_model_entity.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';

enum DrawerType {
   home,
   my,
   none
}

class FrameState {
  RxInt currentIndex = 0.obs;
  Rx<UserInfoBean> userInfo = UserInfoBean().obs;
  final Rx<DrawerType> drawerType = DrawerType.none.obs;
  // tab
  late RxList tabList = <TabEntity>[
    TabEntity(
      text: "首页",
      icon: RemixIcon.home_smile_2_outline,
      activeIcon: RemixIcon.home_smile_2,
    ),
    TabEntity(
      text: "优选",
      icon: RemixIcon.shopping_bag_outline,
      activeIcon: RemixIcon.shopping_bag,
    ),
    TabEntity(
      text: "添加",
      icon: RemixIcon.add,
      activeIcon: RemixIcon.add,
    ),
    TabEntity(
      text: "消息",
      icon: RemixIcon.chat_smile_3_outline,
      activeIcon: RemixIcon.chat_smile_3,
    ),
    TabEntity(
      text: "我的",
      icon: RemixIcon.user_5_outline,
      activeIcon: RemixIcon.user_5,
    )
  ].obs;
  // pageView 控制器
  late Rx<PageController> pageController;
  final RxList<UserPlaceBean> placeList = <UserPlaceBean>[].obs;
  FrameState() {
    pageController = PageController(initialPage: 0, keepPage: true).obs;
  }
}
