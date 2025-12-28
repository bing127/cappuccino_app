import 'package:cappuccino/components/app_image/app_image.dart';
import 'package:cappuccino/components/shop_item.dart';
import 'package:cappuccino/constants/colors.dart';
import 'package:cappuccino/pages/shop/shop_detail/shop_detail_state.dart';
import 'package:cappuccino/routes/app_routes.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'shop_detail_logic.dart';

class ShopDetailPage extends StatelessWidget {
  const ShopDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      assignId: true,
        tag: Utils.uuid(),
      initState: (GetBuilderState<ShopDetailLogic>? state) {},
      init: ShopDetailLogic(),
      builder: (ShopDetailLogic logic) {
        return Material(
          color: const Color(0xfff5f5f5),
          child: SafeArea(
            top: false,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              body: CustomScrollView(
                controller: logic.state.scrollController.value,
                slivers: [
                  SliverAppBar(
                    elevation: 0.0,
                    leadingWidth: 0,
                    automaticallyImplyLeading: false,
                    expandedHeight: Get.height / 2.6,
                    toolbarHeight: kToolbarHeight,
                    pinned: true,
                    backgroundColor: Colors.white,
                    surfaceTintColor: Colors.white,
                    title: Stack(
                      key: logic.state.appBarKey.value,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Obx(() =>
                                  _appBarIcon(RemixIcon.arrow_left_s_outline, () {
                                    Get.back();
                                  }, opacity: logic.state.opacity.value)),
                              Wrap(
                                spacing: 10,
                                children: [
                                  Obx(() => AnimatedOpacity(
                                    opacity: logic.state.opacity.value > 0.5
                                        ? 0
                                        : (logic.state.opacity.value < 0.3
                                        ? 1
                                        : logic.state.opacity.value),
                                    duration: const Duration(milliseconds: 300),
                                    child: _appBarIcon(
                                        RemixIcon.search_outline, () {}),
                                  )),
                                  Obx(() => AnimatedOpacity(
                                    opacity: logic.state.opacity.value > 0.5
                                        ? 0
                                        : (logic.state.opacity.value < 0.3
                                        ? 1
                                        : logic.state.opacity.value),
                                    duration: const Duration(milliseconds: 300),
                                    child: _appBarIcon(
                                        RemixIcon.heart_outline, () {}),
                                  )),
                                  _appBarIcon(RemixIcon.share_outline, () {})
                                ],
                              )
                            ]),
                        Positioned(
                          top: 0,
                          left: 32,
                          right: 32,
                          bottom: 0,
                          child: Obx(() => AnimatedOpacity(
                              opacity: logic.state.opacity.value > 0.7
                                  ? 1
                                  : logic.state.opacity.value,
                              duration: const Duration(milliseconds: 300),
                              child: Container(
                                alignment: Alignment.centerLeft,
                                margin: const EdgeInsets.symmetric(horizontal: 10),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 10),
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 4),
                                      child: Icon(
                                        RemixIcon.search_outline,
                                        color: Colors.black.withOpacity(0.8),
                                        size: 16,
                                      ),
                                    ),
                                    Expanded(
                                        child: Text("${Get.arguments != null && Get.arguments['text'] != null ? Get.arguments['text'] : ''}",
                                            style: TextStyle(
                                                color:
                                                Colors.black.withOpacity(0.8),
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: 14)))
                                  ],
                                ),
                              ))),
                        )
                      ],
                    ),
                    flexibleSpace: FlexibleSpaceBar(
                      title: const SizedBox.shrink(),
                      key: logic.state.tabBarList[0].key,
                      background: Swiper(
                        autoplay: true,
                        itemCount: 3,
                        autoplayDelay: 6000,
                        pagination: const SwiperPagination(
                            alignment: Alignment.bottomRight,
                            builder: FractionPaginationBuilder(
                                activeFontSize: 16, fontSize: 16)),
                        itemBuilder: (context, index) {
                          if (Get.arguments != null &&
                              Get.arguments['picture'] != null) {
                            return Utils.cachePicture(Get.arguments['picture']);
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ),
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(40),
                      child: Obx(() => AnimatedOpacity(
                        duration: const Duration(milliseconds: 300),
                        opacity: logic.state.opacity.value > 0.4
                            ? logic.state.opacity.value
                            : 0,
                        child: _tabBar(logic.state, logic),
                      )),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 12),
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6)),
                            child: _basicInfo(),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 12),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(6)),
                            child: _specs(),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                        key:  logic.state.tabBarList[1].key,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            _comment(),
                            _store(),
                          ],
                        )
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      key: logic.state.tabBarList[2].key,
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: _pictureTextDetail(),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                        key: logic.state.tabBarList[3].key,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: _recommend()
                    ),
                  )
                ],
              ),
              bottomNavigationBar: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  children: [
                    InkWell(
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(RemixIcon.store_3_outline),
                          Text(
                            "店铺",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                      onTap: () {
                        Get.toNamed("${Routes.shop}${Routes.shopStore}");
                      },
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(RemixIcon.service_outline),
                        Text(
                          "服务",
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed("${Routes.shop}${Routes.shopCart}");
                      },
                      child: const Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(RemixIcon.shopping_cart_2_outline),
                          Text(
                            "购物车",
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 26,
                    ),
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Container(
                          decoration: BoxDecoration(
                            color: BasicColor.mainColor.withOpacity(0.2),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: Material(
                                  color: Colors.transparent,
                                  child: AspectRatio(
                                    aspectRatio: 2.6,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "加入购物车",
                                        style: TextStyle(
                                            color: BasicColor.mainColor,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Material(
                                  color: BasicColor.mainColor,
                                  child: AspectRatio(
                                    aspectRatio: 2.6,
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(30))),
                                      child: const Text(
                                        "加入购物车",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _tabBar(ShopDetailState state, ShopDetailLogic logic) {
    return Container(
      key: state.tabBarKey.value,
      padding:
          EdgeInsets.only(bottom: 2, left: Get.width / 6, right: Get.width / 6),
      child: TabBar(
        dividerHeight: 0,
        labelColor: Colors.black,
        labelStyle: const TextStyle(
            color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
        unselectedLabelColor: Colors.black54,
        unselectedLabelStyle: const TextStyle(color: Colors.black54),
        controller: state.tabController.value,
        onTap: logic.tabBarItemTap,
        tabs: state.tabBarList.asMap().keys.map((e) {
          return Tab(
            height: 36,
            iconMargin: EdgeInsets.zero,
            child: Text(state.tabBarList[e].text),
          );
        }).toList(),
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
        indicatorSize: TabBarIndicatorSize.label,
        padding: EdgeInsets.zero,
        indicatorWeight: 2,
        indicatorColor: Colors.red,
        labelPadding: EdgeInsets.zero,
        automaticIndicatorColorAdjustment: true,
      ),
    );
  }

  Widget _appBarIcon(IconData icon, void Function() tap,
      {double? opacity = 0.3}) {
    return Material(
      color: Colors.white.withOpacity(opacity! <= 0 ? 0.1 : opacity),
      clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(32),
      child: InkWell(
        onTap: tap,
        child: Container(
          width: 32,
          height: 32,
          alignment: Alignment.center,
          color: Colors.transparent,
          child: Icon(icon, size: 22, color: Colors.black.withOpacity(0.6)),
        ),
      ),
    );
  }

  Widget _basicInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "¥",
              style: GoogleFonts.oswald(
                fontSize: 16,
                color: Colors.black.withOpacity(0.8),
              ),
            ),
            Text(
              "9.99",
              style: GoogleFonts.oswald(
                fontSize: 28,
                height: 1,
                color: Colors.black.withOpacity(0.8),
              ),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _basicInfoTag("下单返0.7元"),
              _basicInfoTag("商家券 ｜ 满79减3"),
              _basicInfoTag("下单返0.7元"),
              _basicInfoTag("满19减1"),
              _basicInfoTag("下单返0.7元"),
              _basicInfoTag("商家券 ｜ 满79减3"),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            "白象 · 汤好喝老母鸡汤方便面泡面10种口味美味可选免煮速食组合装新人购物",
            style: GoogleFonts.roboto(fontSize: 17, height: 1.5),
          ),
        ),
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text(
              "已售763",
              style: GoogleFonts.roboto(
                  fontSize: 14, color: Colors.black.withOpacity(0.6)),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 14,
              width: 1,
              color: Colors.black.withOpacity(0.3),
            ),
            Text(
              "好评率超过97.3%",
              style: GoogleFonts.roboto(
                  fontSize: 14, color: Colors.black.withOpacity(0.6)),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 14,
              width: 1,
              color: Colors.black.withOpacity(0.3),
            ),
            Text(
              "900+人加购",
              style: GoogleFonts.roboto(
                  fontSize: 14, color: Colors.black.withOpacity(0.6)),
            )
          ],
        )
      ],
    );
  }

  Widget _basicInfoTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      decoration: BoxDecoration(
          color: BasicColor.mainColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(4),
          border: Border.all(color: BasicColor.mainColor, width: 0.5)),
      child: Text(
        text,
        style: TextStyle(color: BasicColor.mainColor, fontSize: 12),
      ),
    );
  }

  Widget _specs() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: const Row(
              children: [
                Text("保障"),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              Icon(
                                RemixIcon.checkbox_circle_outline,
                                size: 16,
                              ),
                              Text("退货包运费")
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              Icon(
                                RemixIcon.checkbox_circle_outline,
                                size: 16,
                              ),
                              Text("15天保价")
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Row(
                            children: [
                              Icon(
                                RemixIcon.checkbox_circle_outline,
                                size: 16,
                              ),
                              Text("极速退款")
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: const Row(
              children: [
                Text("已选"),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: Text("茉莉花茶900ml*6包"),
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              children: [
                const Text("发货"),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Text(
                          "上海",
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 14,
                          width: 1,
                          color: Colors.black.withOpacity(0.3),
                        ),
                        Text(
                          "包邮",
                          style: GoogleFonts.roboto(
                              fontSize: 14,
                              color: Colors.black.withOpacity(0.6)),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _comment() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "买过的人怎么说(43)",
                style: TextStyle(
                    color: Colors.black.withOpacity(0.9), fontSize: 16),
              ),
              Row(
                children: [
                  Text(
                    "6.2分",
                    style: TextStyle(color: Colors.black.withOpacity(0.3)),
                  ),
                  Icon(
                    RemixIcon.arrow_right_s_outline,
                    color: Colors.black.withOpacity(0.3),
                    size: 16,
                  )
                ],
              )
            ],
          ),
          _commentItem(
              "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip"),
          _commentItem(
              "https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30prjacd4mi6g5npha3mgbug7pnq3p60"),
          _commentItem(
              "https://sns-avatar-qc.xhscdn.com/avatar/1040g2jo30otu903h3s6g4bur6ukir1v43niomao"),
        ],
      ),
    );
  }

  Widget _commentItem(String avatar) {
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CircleAvatar(
                  radius: 10,
                  child: Utils.cachePicture(avatar),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 6),
                child: Text(
                  "防晒小天才",
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6), fontSize: 14),
                ),
              )
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Text("属于天津的法式浪漫🎻每一刻都值得被记录", style: TextStyle(
              fontSize: 13
            ),),
          )
        ],
      ),
    );
  }

  Widget _store() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(66),
                child: Utils.cachePicture(
                    "https://sns-img-qc.xhscdn.com/86a87995-f041-a158-d44d-2e7947e154ac",
                    width: 66,
                    height: 66),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "小美的店",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                "卖家口碑 6.32",
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                height: 14,
                                width: 1,
                                color: Colors.black.withOpacity(0.3),
                              ),
                              Text(
                                "已售 832",
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.6)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 32,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  elevation: const MaterialStatePropertyAll(0),
                                  backgroundColor: MaterialStatePropertyAll(
                                      BasicColor.mainColor),
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(32)))),
                              child: const Text("进店"),
                              onPressed: () {
                                Get.toNamed("${Routes.shop}${Routes.shopStore}");
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Wrap(
                spacing: 10,
                children: [
                  _showItem(),
                  _showItem(),
                  _showItem(),
                  _showItem(),
                  _showItem(),
                  _showItem(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _showItem() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(6),
          child: SizedBox(
              width: 100,
              height: 120,
              child: AppImage(
                image: const NetworkImage("https://sns-img-qc.xhscdn.com/86a87995-f041-a158-d44d-2e7947e154ac"),
                fit: BoxFit.cover,
                progress: true,
                color: BasicColor.mainColor.withOpacity(0.3),
              )),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            "鸡肉肠58g泡面搭",
            style: TextStyle(fontSize: 13),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "¥",
                style: GoogleFonts.oswald(
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
              Text(
                "4.3",
                style: GoogleFonts.oswald(
                  fontSize: 18,
                  height: 1,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
              Text(
                "新人价",
                style: GoogleFonts.oswald(
                  fontSize: 13,
                  color: Colors.black.withOpacity(0.8),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _pictureTextDetail() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "图文详情",
              style: TextStyle(fontSize: 16),
            ),
          ),
          Get.arguments != null && Get.arguments['picture'] != null ? AppImage(
            image: NetworkImage(Get.arguments['picture']),
            fit: BoxFit.cover,
            progress: true,
            color: BasicColor.mainColor.withOpacity(0.3),
          ) : const SizedBox.shrink(),
          Get.arguments != null && Get.arguments['picture'] != null ? AppImage(
            image: NetworkImage(Get.arguments['picture']),
            fit: BoxFit.cover,
            progress: true,
            color: BasicColor.mainColor.withOpacity(0.3),
          ) : const SizedBox.shrink(),
          Get.arguments != null && Get.arguments['picture'] != null ? AppImage(
            image: NetworkImage(Get.arguments['picture']),
            fit: BoxFit.cover,
            progress: true,
            color: BasicColor.mainColor.withOpacity(0.3),
          ) : const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          height: 6,
                          width: 60,
                          decoration: BoxDecoration(
                              color: BasicColor.mainColor.withOpacity(0.36),
                              borderRadius: BorderRadius.circular(6)),
                        ),
                      ),
                      const Text(
                        "规格参数",
                        style: TextStyle(
                            fontSize: 15.2, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: RichText(
                    text: const TextSpan(
                        text: "商品编号",
                        style:
                            TextStyle(color: Color(0xFF333333), fontSize: 14),
                        children: [
                          WidgetSpan(
                            child: SizedBox(width: 20),
                          ),
                          TextSpan(text: "10084575817551")
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: RichText(
                    text: const TextSpan(
                        text: "商品毛重",
                        style:
                            TextStyle(color: Color(0xFF333333), fontSize: 14),
                        children: [
                          WidgetSpan(
                            child: SizedBox(width: 20),
                          ),
                          TextSpan(text: "500.00g")
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: RichText(
                    text: const TextSpan(
                        text: "CPU型号",
                        style:
                            TextStyle(color: Color(0xFF333333), fontSize: 14),
                        children: [
                          WidgetSpan(
                            child: SizedBox(width: 20),
                          ),
                          TextSpan(text: "未公布")
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: RichText(
                    text: const TextSpan(
                        text: "运行内存",
                        style:
                            TextStyle(color: Color(0xFF333333), fontSize: 14),
                        children: [
                          WidgetSpan(
                            child: SizedBox(width: 20),
                          ),
                          TextSpan(text: "12GB")
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: RichText(
                    text: const TextSpan(
                        text: "机身颜色",
                        style:
                            TextStyle(color: Color(0xFF333333), fontSize: 14),
                        children: [
                          WidgetSpan(
                            child: SizedBox(width: 20),
                          ),
                          TextSpan(text: "雅丹黑")
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: RichText(
                    text: const TextSpan(
                        text: "三防标准",
                        style:
                            TextStyle(color: Color(0xFF333333), fontSize: 14),
                        children: [
                          WidgetSpan(
                            child: SizedBox(width: 20),
                          ),
                          TextSpan(text: "IP68")
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: RichText(
                    text: const TextSpan(
                        text: "屏幕分辨率",
                        style:
                            TextStyle(color: Color(0xFF333333), fontSize: 14),
                        children: [
                          WidgetSpan(
                            child: SizedBox(width: 20),
                          ),
                          TextSpan(text: "FHD+")
                        ]),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          height: 6,
                          width: 60,
                          decoration: BoxDecoration(
                              color: BasicColor.mainColor.withOpacity(0.36),
                              borderRadius: BorderRadius.circular(6)),
                        ),
                      ),
                      const Text(
                        "价格说明",
                        style: TextStyle(
                            fontSize: 15.2, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: RichText(
                    text: const TextSpan(
                        text: "此刻价：",
                        style:
                            TextStyle(color: Color(0xFF333333), fontSize: 14),
                        children: [
                          TextSpan(text: "此刻价为商品的销售价，是您最终决定是否购买商品的依据。")
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: RichText(
                    text: const TextSpan(
                        text: "划线价：",
                        style:
                            TextStyle(color: Color(0xFF333333), fontSize: 14),
                        children: [
                          TextSpan(
                              text:
                                  "商品展示的划横线价格为参考价，并非原价，该价格可能是品牌专柜标价、商品吊牌价或由品牌供应商提供的正品零售价（如厂商指导价、建议零售价等）或其他真实有依据的价格；由于地区、时间的差异性和市场行情波动，品牌专柜标价、商品吊牌价等可能会与您购物时展示的不一致，该价格仅供您参考。")
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: RichText(
                    text: const TextSpan(
                        text: "折扣：",
                        style:
                            TextStyle(color: Color(0xFF333333), fontSize: 14),
                        children: [
                          TextSpan(
                              text:
                                  "如无特殊说明，折扣指销售商在原价、或划线价（如品牌专柜标价、商品吊牌价、厂商指导价、厂商建议零售价）等某一价格基础上计算出的优惠比例或优惠金额；如有疑问，您可在购买前联系销售商进行咨询。")
                        ]),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: RichText(
                    text: const TextSpan(
                        text: "异常问题：",
                        style:
                            TextStyle(color: Color(0xFF333333), fontSize: 14),
                        children: [
                          TextSpan(
                              text:
                                  "商品促销信息以商品详情页“促销”栏中的信息为准；商品的具体售价以订单结算页价格为准；如您发现活动商品售价或促销信息有异常，建议购买前先联系销售商咨询。")
                        ]),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _recommend() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(6)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "相关推荐",
              style: TextStyle(fontSize: 16),
            ),
          ),
          SingleChildScrollView(
            child: StaggeredGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                ShopItem(
                  picture:
                  "https://m.360buyimg.com/babel/jfs/t20260827/220817/32/35154/23241/64ec1ab4F5dfe65ed/6af0e0ccdc20fd0c.jpg.webp",
                  price: 7788.9,
                  text:
                  "联想拯救者Y7000P 2023款16英寸专业电竞游戏本 满功耗RTX4050-6G独显 13代标压酷睿 i5-13500H 16G 1TB  定制版 16英寸电竞屏｜2.5K｜165Hz",
                  salesVolume: "3000+已买",
                  onTap: (String picture, String text) {
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", preventDuplicates: false, arguments: <String, String>{
                      "picture": picture,
                      "text": text
                    });
                  },
                ),
                ShopItem(
                  picture:
                  "https://m.360buyimg.com/babel/jfs/t20260619/208709/3/36645/26321/64916ab3F863fb7e7/0d9e57d0ef3ba111.jpg.webp",
                  price: 7788.9,
                  text:
                  "神舟（HASEE）战神Z7/Z8/Z9/ 13代英特尔酷睿i7/i9 RTX4050/4060/4070游戏笔记本电脑 S8D6QHD升级 i7/16G/1TB/4060 支持独显直连 高刷新电竞屏",
                  salesVolume: "3000+已买",
                  onTap: (String picture, String text) {
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", preventDuplicates: false, arguments: <String, String>{
                      "picture": picture,
                      "text": text
                    });
                  },),
                ShopItem(
                  picture:
                  "https://m.360buyimg.com/babel/jfs/t1/194436/24/40476/191994/65309667F585ba8a7/66b8a82c22a0b6a5.jpg.webp",
                  price: 7788.9,
                  text:
                  "Punos（博浪沙）全新Ai智能语音点歌评分ktv音响套装3D环绕HiFi家庭影院客厅音箱家庭ktv唱歌全套设备 PS-28 Pro 一体式3D影院KTV套装",
                  salesVolume: "3000+已买",
                  onTap: (String picture, String text) {
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", preventDuplicates: false, arguments: <String, String>{
                      "picture": picture,
                      "text": text
                    });
                  },),
                ShopItem(
                  picture:
                  "https://sns-img-bd.xhscdn.com/686b7b8d-4536-0813-4b43-68ae3fb83981",
                  price: 7788.9,
                  text: "华为鸿蒙4.0对比小米miui14 丝滑和闪电",
                  salesVolume: "3000+已买",
                  onTap: (String picture, String text) {
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", preventDuplicates: false, arguments: <String, String>{
                      "picture": picture,
                      "text": text
                    });
                  },),
                ShopItem(
                  picture:
                  "https://sns-img-bd.xhscdn.com/8c6e5030-5a3a-3ff6-3e7f-0dcc161026f3",
                  price: 7788.9,
                  text: "2人住进90平的小家🏠婚后生活比想象快乐",
                  salesVolume: "3000+已买",
                  onTap: (String picture, String text) {
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", preventDuplicates: false, arguments: <String, String>{
                      "picture": picture,
                      "text": text
                    });
                  },),
                ShopItem(
                  picture:
                  "https://sns-img-bd.xhscdn.com/b34051a7-b1be-d644-265c-45408e60c85d",
                  price: 7788.9,
                  text: "我妈说，普通人的家干净清爽就够了！",
                  salesVolume: "3000+已买",
                  onTap: (String picture, String text) {
                    Get.toNamed("${Routes.shop}${Routes.shopDetail}", preventDuplicates: false, arguments: <String, String>{
                      "picture": picture,
                      "text": text
                    });
                  },),
              ],
            ),
          )
        ],
      ),
    );
  }
}
