import 'package:cappuccino/pages/shop/shop_detail/shop_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShopDetailState {
  late Rx<TabController> tabController;
  late Rx<ScrollController> scrollController;
  final Rx<GlobalKey> appBarKey = GlobalKey(debugLabel: 'appBar').obs;
  final Rx<GlobalKey> tabBarKey = GlobalKey(debugLabel: 'tabBar').obs;
  late RxList<ShopViewModel> tabBarList = [
    ShopViewModel(
      text: '商品',
      key: GlobalKey(debugLabel: 'tab1'),
      min: 0,
      max: 0
    ),
    ShopViewModel(
        text: '点评',
        key: GlobalKey(debugLabel: 'tab2'),
        min: 0,
        max: 0
    ),
    ShopViewModel(
        text: '详情',
        key: GlobalKey(debugLabel: 'tab3'),
        min: 0,
        max: 0
    ),
    ShopViewModel(
        text: '推荐',
        key: GlobalKey(debugLabel: 'tab4'),
        min: 0,
        max: 0
    ),
  ].obs;
  late RxList<List<double>> offsetList = [[0.0, 0.0]].obs;
  RxBool isOpenListener = true.obs;
  RxInt tabBarIndex = 0.obs;
  Rx<SliverAppBar> sliverAppBar = const SliverAppBar().obs;
  RxDouble opacity = 0.0.obs;
  ShopDetailState() {
    ///Initialize variables
  }
}
