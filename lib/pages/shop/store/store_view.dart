import 'package:cappuccino/constants/colors.dart';
import 'package:cappuccino/pages/shop/store/business/business_view.dart';
import 'package:cappuccino/pages/shop/store/collect/collect_view.dart';
import 'package:cappuccino/pages/shop/store/like/like_view.dart';
import 'package:cappuccino/pages/shop/store/note/note_view.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'store_logic.dart';

class StorePage extends StatelessWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<StoreLogic>();
    final state = Get.find<StoreLogic>().state;
    return SafeArea(
        top: false,
        child: Scaffold(
          backgroundColor: const Color(0xfff5f5f5),
          body: CustomScrollView(
              controller: logic.state.scrollController.value,
              slivers: [
                SliverAppBar(
                  backgroundColor: const Color(0xff2f3d37),
                  surfaceTintColor: const Color(0xff2f3d37),
                  elevation: 0.0,
                  systemOverlayStyle: Utils.light,
                  expandedHeight: 340,
                  pinned: true,
                  centerTitle: true,
                  title: Obx(() => AnimatedOpacity(
                    opacity: logic.state.opacity.value,
                    duration: const Duration(milliseconds: 300),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Utils.cachePicture(
                          "https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30o436ng226005nsc2pg09eqah0vcii8",
                          width: 30, height: 30),
                    ),
                  )),
                  leading: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Icon(
                        RemixIcon.arrow_left_s_outline,
                        color: logic.state.opacity.value == 1
                            ? Colors.black
                            : Colors.white,
                        size: 26,
                      ),
                    ),
                  ),
                  actions: [
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Icon(
                          RemixIcon.more_outline,
                          color: logic.state.opacity.value == 1
                              ? Colors.black
                              : Colors.white,
                          size: 20,
                        ),
                      ),
                    )
                  ],
                  flexibleSpace: FlexibleSpaceBar(
                    background: Container(
                      padding: const EdgeInsets.only(
                          top: 133, left: 12, right: 12),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xff2f3d37), Color(0xff4b525a)],
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Stack(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(80),
                                    child: Utils.cachePicture(
                                        "https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30o436ng226005nsc2pg09eqah0vcii8",
                                        width: 80),
                                  )
                                ],
                              ),
                              Container(
                                height: 80,
                                padding: const EdgeInsets.only(left: 12),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '春暖花开',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(top: 6),
                                      child: Row(
                                        children: [
                                          Text(
                                            "小红书号: 4944147233",
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.36),
                                                fontSize: 14),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Text(
                              "点击这里，填写简介",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 14),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 10),
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(16)),
                            child: Icon(
                              RemixIcon.men_outline,
                              color: Colors.blue.withOpacity(0.6),
                              size: 14,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Wrap(
                                  spacing: 20,
                                  children: [
                                    Column(
                                      children: [
                                        Text("3263w",
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                fontSize: 16)),
                                        Text("关注",
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.6),
                                                fontSize: 14)),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("8696w",
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                fontSize: 16)),
                                        Text("粉丝",
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.6),
                                                fontSize: 14)),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Text("32",
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.8),
                                                fontSize: 16)),
                                        Text("获赞与收藏",
                                            style: TextStyle(
                                                color: Colors.white
                                                    .withOpacity(0.6),
                                                fontSize: 14)),
                                      ],
                                    )
                                  ],
                                ),
                                Wrap(
                                  spacing: 10,
                                  children: [
                                    InkWell(
                                      child: Material(
                                        color:
                                        BasicColor.mainColor,
                                        shape: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            width: 0
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(30),
                                        ),
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.symmetric(
                                              vertical: 6,
                                              horizontal: 16),
                                          child: Text('关注',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14)),
                                        ),
                                      ),
                                      onTap: () {},
                                    ),
                                    InkWell(
                                      child: Material(
                                        color:
                                        Colors.white.withOpacity(0.1),
                                        shape: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.white
                                                .withOpacity(0.3),
                                          ),
                                          borderRadius:
                                          BorderRadius.circular(30),
                                        ),
                                        child: Padding(
                                            padding:
                                            const EdgeInsets.symmetric(
                                                vertical: 6,
                                                horizontal: 12),
                                            child: Icon(
                                              RemixIcon.message_3_outline,
                                              color: Colors.white
                                                  .withOpacity(0.6),
                                              size: 18,
                                            )),
                                      ),
                                      onTap: () {},
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(40),
                      child: Container(
                        key: logic.state.tabBarGlobalKey.value,
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12))),
                        child: TabBar(
                          labelColor: Colors.black,
                          dividerHeight: 0,
                          labelStyle: const TextStyle(
                              color: Colors.red,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                          unselectedLabelColor: Colors.black54,
                          unselectedLabelStyle:
                          const TextStyle(color: Colors.black54),
                          controller: logic.tabController.value,
                          onTap: (index) {},
                          tabs: const [
                            Tab(
                              height: 40,
                              iconMargin: EdgeInsets.zero,
                              child: Text("店铺"),
                            ),
                            Tab(
                              height: 40,
                              iconMargin: EdgeInsets.zero,
                              child: Text("笔记"),
                            ),
                            Tab(
                              height: 40,
                              iconMargin: EdgeInsets.zero,
                              child: Text("收藏"),
                            ),
                            Tab(
                              height: 40,
                              iconMargin: EdgeInsets.zero,
                              child: Text("赞过"),
                            )
                          ],
                          indicatorSize: TabBarIndicatorSize.label,
                          padding: EdgeInsets.symmetric(
                              horizontal: Get.width / 6),
                          indicatorWeight: 2,
                          indicatorPadding: const EdgeInsets.only(
                              bottom: 6,
                              left: 2,
                              right: 2
                          ),
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.zero,
                              border: Border(
                                  bottom: BorderSide(
                                      width: 2,
                                      color: BasicColor.mainColor
                                  )
                              )
                          ),
                          automaticIndicatorColorAdjustment: true,
                        ),
                      )),
                ),
                SliverFillRemaining(
                  child: TabBarView(
                    controller: logic.tabController.value,
                    children: const [
                      BusinessPage(),
                      NotePage(),
                      CollectPage(),
                      LikePage(),
                    ],
                  ),
                )
              ]),
        ));
  }
}
