import 'package:cappuccino/components/app_image/app_image.dart';
import 'package:cappuccino/components/cache_widget.dart';
import 'package:cappuccino/constants/colors.dart';
import 'package:cappuccino/pages/frame/frame_logic.dart';
import 'package:cappuccino/pages/frame/frame_state.dart';
import 'package:cappuccino/pages/my/collect/collect_view.dart';
import 'package:cappuccino/pages/my/like/like_view.dart';
import 'package:cappuccino/pages/my/note/note_view.dart';
import 'package:cappuccino/routes/app_routes.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'my_logic.dart';

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<MyLogic>();
    final frameState = Get.find<FrameLogic>().state;
    final state = Get.find<MyLogic>().state;

    return SafeArea(
        top: false,
        child: CacheWidget(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: CustomScrollView(
                controller: logic.state.scrollController.value,
                slivers: [
                  SliverAppBar(
                    systemOverlayStyle: Utils.dark,
                    backgroundColor: const Color(0xff2f3d37),
                    surfaceTintColor: const Color(0xff2f3d37),
                    elevation: 0.0,
                    expandedHeight: 400,
                    pinned: true,
                    centerTitle: true,
                    title: Obx(() => AnimatedOpacity(
                      opacity: logic.state.opacity.value,
                      duration: const Duration(milliseconds: 300),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Obx(() => SizedBox(
                            width: 30, height: 30,
                            child: state.userInfo.value.user?.avatar != null ? AppImage(
                              image: NetworkImage(state.userInfo.value.user!.avatar as String), fit: BoxFit.cover,
                            ) : Image.asset("assets/images/logo_transparent.png"))),
                      ),
                    )),
                    leading: InkWell(
                      onTap: () {
                        logic.setOpen(true);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Icon(
                          RemixIcon.menu_outline,
                          color: logic.state.opacity.value == 1
                              ? Colors.black
                              : Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                    actions: [
                      TextButton(onPressed: () {},
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
                            child: Container(
                              padding:
                              const EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 16),
                              child: Text('设置背景',
                                  style: GoogleFonts.roboto(
                                      color: Colors.white
                                          .withOpacity(0.6),
                                      fontSize: 14)),
                            ),
                          )
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed("${Routes.my}${Routes.myScan}");
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Icon(
                            RemixIcon.qr_scan_2_outline,
                            color: logic.state.opacity.value == 1
                                ? Colors.black
                                : Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _showShare(context, logic);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(12),
                          child: Icon(
                            RemixIcon.share_box_outline,
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
                        height:  Get.height / 2.32,
                        padding: const EdgeInsets.only(
                            top: 113, left: 12, right: 12, bottom: 20),
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
                                    clipBehavior: Clip.none,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(80),
                                        child: Obx(() => SizedBox(
                                          width: 80,
                                          height: 80,
                                          child: state.userInfo.value.user?.avatar != null ? AppImage(image: NetworkImage(state.userInfo.value.user!.avatar as String), fit: BoxFit.cover) : Image.asset("assets/images/logo_transparent.png"),
                                        ))),
                                      Positioned(
                                        top: 40,
                                        right: -16,
                                        child: IconButton(
                                          onPressed: () {
                                            frameState.drawerType.value = DrawerType.home;
                                          },
                                          style: const ButtonStyle(
                                              padding: MaterialStatePropertyAll(EdgeInsets.zero),
                                              maximumSize: MaterialStatePropertyAll(Size(26, 26)),
                                              minimumSize: MaterialStatePropertyAll(Size(26, 26)),
                                              fixedSize: MaterialStatePropertyAll(Size(26, 26)),
                                              backgroundColor: MaterialStatePropertyAll(Color(0xfff2e24c))
                                          ),
                                          icon:const Icon(RemixIcon.add,
                                              color: Colors.black, size: 16),
                                        ),
                                      ),
                                    ]
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
                                      Obx(() => Text(
                                        state.userInfo.value.user?.nickName ?? "--",
                                        style: GoogleFonts.roboto(
                                            color: Colors.white,
                                            fontSize: 20),
                                      )),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(top: 6),
                                        child: Row(
                                          children: [
                                            Obx(() => Text(
                                              "此刻号: ${state.userInfo.value.user?.ksId ?? '--'}",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.white
                                                      .withOpacity(0.36),
                                                  fontSize: 14),
                                            )),
                                            InkWell(
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.all(4),
                                                child: Icon(
                                                    RemixIcon.qr_code_outline,
                                                    size: 16,
                                                    color: Colors.white
                                                        .withOpacity(0.36)),
                                              ),
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
                              child: Obx(() => Text(
                                state.userInfo.value.user?.profile ?? "点击这里，填写简介",
                                style: GoogleFonts.roboto(
                                    color: Colors.white.withOpacity(0.6),
                                    fontSize: 14),
                              )),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 3, horizontal: 8),
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
                                              style: GoogleFonts.oswald(
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                  fontSize: 16)),
                                          Text("关注",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.white
                                                      .withOpacity(0.6),
                                                  fontSize: 14)),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text("8696w",
                                              style: GoogleFonts.oswald(
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                  fontSize: 16)),
                                          Text("粉丝",
                                              style: GoogleFonts.roboto(
                                                  color: Colors.white
                                                      .withOpacity(0.6),
                                                  fontSize: 14)),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Text("32",
                                              style: GoogleFonts.oswald(
                                                  color: Colors.white
                                                      .withOpacity(0.8),
                                                  fontSize: 16)),
                                          Text("获赞与收藏",
                                              style: GoogleFonts.roboto(
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
                                          Colors.white.withOpacity(0.1),
                                          shape: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Colors.white
                                                  .withOpacity(0.3),
                                            ),
                                            borderRadius:
                                            BorderRadius.circular(30),
                                          ),
                                          child: Container(
                                            height: 32,
                                            alignment: Alignment.center,
                                            padding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 16),
                                            child: Text('编辑资料',
                                                style: GoogleFonts.roboto(
                                                    color: Colors.white
                                                        .withOpacity(0.6),
                                                    fontSize: 14)),
                                          ),
                                        ),
                                        onTap: () {
                                          Get.toNamed("${Routes.my}${Routes.myUser}");
                                        },
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
                                          child: Container(
                                              height: 32,
                                              padding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 16),
                                              child: Icon(
                                                RemixIcon.settings_2_outline,
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
                            Padding(
                              padding: const EdgeInsets.only(top: 18),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      child: Material(
                                        color: Colors.white.withOpacity(0.1),
                                        borderRadius:
                                        BorderRadius.circular(2),
                                        child: Padding(
                                            padding:
                                            const EdgeInsets.symmetric(
                                                vertical: 6,
                                                horizontal: 16),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      RemixIcon
                                                          .shopping_cart_2_outline,
                                                      color: Colors.white
                                                          .withOpacity(0.8),
                                                      size: 16,
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .only(left: 4),
                                                      child: Text('购物车',
                                                          style: GoogleFonts.roboto(
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                  0.8),
                                                              fontSize: 14)),
                                                    )
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 6),
                                                  child: Text('查看推荐好物',
                                                      style:
                                                      GoogleFonts.roboto(
                                                          color: Colors
                                                              .white
                                                              .withOpacity(
                                                              0.6),
                                                          fontSize: 13)),
                                                ),
                                              ],
                                            )),
                                      ),
                                      onTap: () {},
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      child: Material(
                                        color: Colors.white.withOpacity(0.1),
                                        borderRadius:
                                        BorderRadius.circular(2),
                                        child: Padding(
                                            padding:
                                            const EdgeInsets.symmetric(
                                                vertical: 6,
                                                horizontal: 16),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      RemixIcon
                                                          .shopping_cart_2_outline,
                                                      color: Colors.white
                                                          .withOpacity(0.8),
                                                      size: 16,
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .only(left: 4),
                                                      child: Text('创作灵感',
                                                          style: GoogleFonts.roboto(
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                  0.8),
                                                              fontSize: 14)),
                                                    )
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 6),
                                                  child: Text('学创作找灵感',
                                                      style:
                                                      GoogleFonts.roboto(
                                                          color: Colors
                                                              .white
                                                              .withOpacity(
                                                              0.6),
                                                          fontSize: 13)),
                                                )
                                              ],
                                            )),
                                      ),
                                      onTap: () {},
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: InkWell(
                                      child: Material(
                                        color: Colors.white.withOpacity(0.1),
                                        borderRadius:
                                        BorderRadius.circular(2),
                                        child: Padding(
                                            padding:
                                            const EdgeInsets.symmetric(
                                                vertical: 6,
                                                horizontal: 16),
                                            child: Column(
                                              crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Icon(
                                                      RemixIcon
                                                          .shopping_cart_2_outline,
                                                      color: Colors.white
                                                          .withOpacity(0.8),
                                                      size: 16,
                                                    ),
                                                    Padding(
                                                      padding:
                                                      const EdgeInsets
                                                          .only(left: 4),
                                                      child: Text('浏览记录',
                                                          style: GoogleFonts.roboto(
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                  0.8),
                                                              fontSize: 14)),
                                                    )
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                  const EdgeInsets.only(
                                                      top: 6),
                                                  child: Text('看过的笔记',
                                                      style:
                                                      GoogleFonts.roboto(
                                                          color: Colors
                                                              .white
                                                              .withOpacity(
                                                              0.6),
                                                          fontSize: 13)),
                                                )
                                              ],
                                            )),
                                      ),
                                      onTap: () {},
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(40),
                        child: Container(
                          key: logic.state.tabBarGlobalKey.value,
                          decoration: BoxDecoration(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12))),
                          child: TabBar(
                            labelColor: Theme.of(context).primaryColor,
                            labelStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                            unselectedLabelColor: Theme.of(context).appBarTheme.titleTextStyle?.color?.withOpacity(0.3),
                            dividerHeight: 0,
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
                            unselectedLabelStyle:
                            const TextStyle(color: Colors.black54),
                            controller: logic.tabController.value,
                            onTap: (index) {},
                            tabs: const [
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
                                horizontal: Get.width / 5),
                            indicatorWeight: 2,
                            indicatorColor: Colors.red,
                            automaticIndicatorColorAdjustment: true,
                          ),
                        )),
                  ),
                  SliverFillRemaining(
                    child: TabBarView(
                      controller: logic.tabController.value,
                      children: const [
                        NotePage(),
                        CollectPage(),
                        LikePage(),
                      ],
                    ),
                  )
                ]),
          ),
        )
    );
  }

  void _showShare(BuildContext context, MyLogic logic) {
    double defaultHeight = Get.height / 2.3;
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext parentContext) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: defaultHeight,
                decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(6),
                    topRight: Radius.circular(6)
                  )
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Container(
                       padding: const EdgeInsets.symmetric(
                         vertical: 2
                       ),
                       alignment: Alignment.center,
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         crossAxisAlignment: CrossAxisAlignment.center,
                         children: [
                           TextButton(onPressed: () {}, child: const SizedBox.shrink()),
                           const Text("分享至", style: TextStyle(
                               fontSize: 16,
                               fontWeight: FontWeight.bold
                           ),),
                           TextButton(onPressed: () {
                             Navigator.of(parentContext).pop();
                           }, child: Icon(
                             RemixIcon.close_outline,
                             color: const Color(0xff333333).withOpacity(0.3),
                           ))
                         ],
                       ),
                     ),
                     Container(
                       padding: const EdgeInsets.symmetric(
                           horizontal: 12
                       ),
                       height: 96,
                       decoration: BoxDecoration(
                         border: Border(
                           bottom: BorderSide(
                               color: Theme.of(context).dividerColor.withOpacity(0.1),
                               width: 0.5)
                         )
                       ),
                       child: ListView(
                         shrinkWrap: true,
                         scrollDirection: Axis.horizontal,
                         children: [
                           _shareItem(
                               avatar: "https://sns-img-hw.xhscdn.net/8aca10ef-3a82-8289-e339-660f57311a83?imageView2/2/w/60/format/webp|imageMogr2/strip",
                             text: "甜了个莉莉甜了个莉莉甜了个莉莉"
                           ),
                           _shareItem(
                               avatar: "https://sns-img-hw.xhscdn.net/8aca10ef-3a82-8289-e339-660f57311a83?imageView2/2/w/60/format/webp|imageMogr2/strip",
                               text: "甜了个莉莉甜了个莉莉甜了个莉莉"
                           ),
                           _shareItem(
                               avatar: "https://sns-img-hw.xhscdn.net/8aca10ef-3a82-8289-e339-660f57311a83?imageView2/2/w/60/format/webp|imageMogr2/strip",
                               text: "甜了个莉莉甜了个莉莉甜了个莉莉"
                           ),
                           _shareItem(
                               avatar: "https://sns-img-hw.xhscdn.net/8aca10ef-3a82-8289-e339-660f57311a83?imageView2/2/w/60/format/webp|imageMogr2/strip",
                               text: "甜了个莉莉甜了个莉莉甜了个莉莉"
                           ),
                           _shareItem(
                               avatar: "https://sns-img-hw.xhscdn.net/8aca10ef-3a82-8289-e339-660f57311a83?imageView2/2/w/60/format/webp|imageMogr2/strip",
                               text: "甜了个莉莉甜了个莉莉甜了个莉莉"
                           ),
                           _shareItem(
                               avatar:
                               "https://sns-img-hw.xhscdn.net/8aca10ef-3a82-8289-e339-660f57311a83?imageView2/2/w/60/format/webp|imageMogr2/strip",
                               text: "甜了个莉莉甜了个莉莉甜了个莉莉"
                           ),
                           _shareItem(
                               avatar:
                               "https://sns-img-hw.xhscdn.net/8aca10ef-3a82-8289-e339-660f57311a83?imageView2/2/w/60/format/webp|imageMogr2/strip",
                               text: "甜了个莉莉甜了个莉莉甜了个莉莉"
                           ),
                           _shareItem(
                               avatar:
                               "https://sns-img-hw.xhscdn.net/8aca10ef-3a82-8289-e339-660f57311a83?imageView2/2/w/60/format/webp|imageMogr2/strip",
                               text: "甜了个莉莉甜了个莉莉甜了个莉莉"
                           ),
                         ],
                       ),
                     ),
                     Container(
                      padding: const EdgeInsets.symmetric(
                           horizontal: 12
                       ),
                      height: 96,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Theme.of(context).dividerColor.withOpacity(0.1),
                                  width: 0.5)
                          )
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _shareItem(
                            isIcon: true,
                            color: const Color(0xffea3f4a),
                            child: const Icon(
                              RemixIcon.send_plane,
                              color: Colors.white,
                            ),
                            text: "私信好友"
                          ),
                          _shareItem(
                              isIcon: true,
                              color: const Color(0xff07C160),
                              child: const Icon(
                              RemixIcon.wechat,
                              color: Colors.white,
                            ),
                              text: "微信好友"
                          ),
                          _shareItem(
                              isIcon: true,
                              color: const Color(0xff2BBE65),
                              child: const Icon(
                              RemixIcon.wechat_channels,
                              color: Colors.white,
                            ),
                              text: "朋友圈"
                          ),
                        ],
                      ),
                    ),
                     Container(
                       padding: const EdgeInsets.symmetric(
                           horizontal: 12
                       ),
                      height: 96,
                      width: double.infinity,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _shareItem(
                              isIcon: true,
                              color: const Color(0xffffffff),
                              child: Icon(
                                RemixIcon.link,
                                color: const Color(0xff333333).withOpacity(0.3),
                              ),
                              text: "复制链接"
                          ),
                          _shareItem(
                              isIcon: true,
                              color: const Color(0xffffffff),
                              child: Icon(
                                RemixIcon.qr_code,
                                color: const Color(0xff333333).withOpacity(0.3),
                              ),
                              text: "我的二维码"
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  Widget _shareItem({ bool? isIcon = false, String? avatar, String? text,  Widget? child = const SizedBox.shrink(), Color? color = Colors.transparent }) {
    return Container(
      width: 72,
      margin: const EdgeInsets.only(
        right: 10,
        top: 10
      ),
      padding: const EdgeInsets.only(
        bottom: 10
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          isIcon == false ? ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Utils.cachePicture(avatar!,   width: 40,
              height: 40),
          ) : Container(
            width: 40,
            height: 40,
             alignment: Alignment.center,
             decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(20),
               color: color
             ),
            child: child,
          ),
          Padding(padding: const EdgeInsets.only(
            top: 6
          ),child: Text(
            text ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(
              height: 1.1,
              fontSize: 13,
            ),
          ),)
        ],
      ),
    );
  }
}
