import 'package:cappuccino/pages/shop/shop_detail/shop_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'shop_detail_state.dart';

class ShopDetailLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final ShopDetailState state = ShopDetailState();

  @override
  void onInit() {
    state.tabController = TabController(length: 4, vsync: this).obs;
    state.scrollController = ScrollController().obs;
    super.onInit();
  }

  @override
  void onReady() {
    double defaultStretch = Get.height / 2.6;
    double topHeight = getOffset(state.appBarKey.value)!.height + getOffset(state.tabBarKey.value)!.height + Get.mediaQuery.padding.top;
    state.tabBarList.asMap().keys.forEach((e) {
      ShopLocationOffset offset = getOffset(state.tabBarList[e].key) as ShopLocationOffset;
      state.tabBarList[e].min = offset.min - topHeight - 10;
      state.tabBarList[e].max = offset.max - topHeight - 10;
    });
    state.offsetList.value = state.tabBarList.asMap().values.map((e) => [e.min, e.max]).toList();
    state.scrollController.value.addListener(() {
      double offset = state.scrollController.value.offset;
      double scale = offset /defaultStretch;
      if(scale >= 1) {
        state.opacity.value = 1;
      }else if(scale <=0) {
        state.opacity.value = 0;
      } else {
        state.opacity.value = scale;
      }
      if (state.isOpenListener.value) {
        if(state.offsetList.isNotEmpty) {
          state.offsetList.asMap().keys.forEach((element) {
            if(offset >= state.offsetList[element][0] && offset < state.offsetList[element][1]) {
              state.tabBarIndex.value = element;
              state.tabController.value.index = element;
            }
          });
        }
      }
    });
    super.onReady();
  }

  ShopLocationOffset? getOffset(GlobalKey key) {
    final RenderBox? renderBox = key.currentContext?.findRenderObject() as RenderBox?;
    Offset? offset = renderBox?.localToGlobal(Offset.zero);
    return ShopLocationOffset(
      min: offset!.dy,
      max: renderBox!.size.height + offset.dy,
      height: renderBox.size.height,
    );
  }

  void tabBarItemTap(int index) {
    state.tabBarIndex.value = index;
    state.tabController.value.index = index;
    state.isOpenListener.value = false;
    if(!state.isOpenListener.value) {
      state.scrollController.value.animateTo(state.offsetList[index][0], duration: const Duration(milliseconds: 120), curve: Curves.fastLinearToSlowEaseIn).then((value) {
        state.isOpenListener.value = true;
      });
    }
  }

  @override
  void dispose() {
    state.tabController.value.dispose();
    state.scrollController.value.removeListener(() {});
    state.scrollController.value.dispose();
    super.dispose();
  }
}
