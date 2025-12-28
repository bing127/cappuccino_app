import 'package:cappuccino/constants/colors.dart';
import 'package:cappuccino/pages/home/find/find_view.dart';
import 'package:cappuccino/pages/home/local/local_view.dart';
import 'package:cappuccino/routes/app_routes.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';
import 'home_logic.dart';
import 'follow/follow_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<HomeLogic>();
    Utils.setUI(statusBarColor: Colors.white, fontIsDark: true);
    return Scaffold(
        body: Material(
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: Container(
              padding: EdgeInsets.only(top: context.mediaQueryPadding.top),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            logic.setOpen(true);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              "assets/images/QKr.png",
                              width: 22,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: TabBar(
                              labelColor: Colors.black,
                              labelStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                              unselectedLabelColor: Colors.black54,
                              unselectedLabelStyle:
                              const TextStyle(color: Colors.black54),
                              dividerHeight: 0,
                              indicator: BoxDecoration(
                                 borderRadius: BorderRadius.zero,
                                border: Border(
                                  bottom: BorderSide(
                                    width: 2,
                                    color: BasicColor.mainColor
                                  )
                                )
                              ),
                              controller: logic.tabController.value,
                              onTap: (index) {},
                              tabs: [
                                const Tab(
                                  height: 40,
                                  iconMargin: EdgeInsets.zero,
                                  child: Text("关注"),
                                ),
                                const Tab(
                                  height: 40,
                                  iconMargin: EdgeInsets.zero,
                                  child: Text("发现"),
                                ),
                                Tab(
                                  height: 40,
                                  iconMargin: EdgeInsets.zero,
                                  child: Obx(() => Text(logic.state.location.value)),
                                )
                              ],
                              indicatorSize: TabBarIndicatorSize.label,
                              padding: EdgeInsets.zero,
                              indicatorPadding: const EdgeInsets.only(
                                bottom: 6,
                                left: 2,
                                right: 2
                              ),
                              indicatorWeight: 2,
                              indicatorColor: BasicColor.mainColor,
                              labelPadding: EdgeInsets.zero,
                              automaticIndicatorColorAdjustment: true,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.toNamed(Routes.search);
                          },
                          child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(
                                RemixIcon.search_2_outline,
                                size: 18,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ExtendedTabBarView(
                        shouldIgnorePointerWhenScrolling: false,
                        controller: logic.tabController.value,
                        link: true,
                        children: <Widget>[
                          const FollowPage(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TabBar(
                                  labelColor: Colors.black,
                                  labelStyle: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                  unselectedLabelColor: Colors.black54,
                                  dividerHeight: 0,
                                  unselectedLabelStyle:
                                  const TextStyle(color: Colors.black54),
                                  tabAlignment: TabAlignment.start,
                                  isScrollable: true,
                                  indicatorWeight: 2,
                                  indicatorColor: Colors.red,
                                  automaticIndicatorColorAdjustment: true,
                                  indicator: const BoxDecoration(),
                                  onTap: (i) {},
                                  controller: logic.findTabController.value,
                                  tabs: const [
                                    Tab(
                                      height: 30,
                                      child: Text(
                                        '推荐',
                                      ),
                                    ),
                                    Tab(
                                      height: 30,
                                      child: Text(
                                        '视频',
                                      ),
                                    ),
                                    Tab(
                                      height: 30,
                                      child: Text(
                                        '直播',
                                      ),
                                    ),
                                    Tab(
                                      height: 30,
                                      child: Text(
                                        '科技数码',
                                      ),
                                    ),
                                    Tab(
                                      height: 30,
                                      child: Text(
                                        '机车',
                                      ),
                                    ),
                                    Tab(
                                      height: 30,
                                      child: Text(
                                        '旅行',
                                      ),
                                    ),
                                    Tab(
                                      height: 30,
                                      child: Text(
                                        '美食',
                                      ),
                                    ),
                                    Tab(
                                      height: 30,
                                      child: Text(
                                        '科学科普',
                                      ),
                                    ),
                                    Tab(
                                      height: 30,
                                      child: Text(
                                        '穿搭',
                                      ),
                                    ),
                                  ]),
                              Expanded(
                                child: ExtendedTabBarView(
                                  shouldIgnorePointerWhenScrolling: false,
                                  controller: logic.findTabController.value,
                                  link: true,
                                  children: const <Widget>[
                                    FindPage(),
                                    FindPage(),
                                    FindPage(),
                                    FindPage(),
                                    FindPage(),
                                    FindPage(),
                                    FindPage(),
                                    FindPage(),
                                    FindPage(),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const LocalPage(),
                        ]),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
