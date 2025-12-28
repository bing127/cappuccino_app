import 'package:cappuccino/pages/home/send/send_more/send_more_view.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:extended_tabs/extended_tabs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'send_logic.dart';

class SendPage extends StatelessWidget {
  final Function() callback;

  const SendPage({super.key, required this.callback});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SendLogic(),
      assignId: true,
      builder: (SendLogic logic) {
        return Material(
          color: Colors.black,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                key: logic.state.appBarGlobalKey.value,
                leadingWidth: 0,
                elevation: 0,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                leading: const SizedBox.shrink(),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 10,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Utils.cachePicture(
                              "https://sns-img-bd.xhscdn.com/863ec559-b5e8-434d-b6b0-2454c12eb874?imageView2/2/w/60/format/webp|imageMogr2/strip",
                              width: 36, height: 36),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "记录我的日常",
                              style: TextStyle(fontSize: 16,
                                  color: Colors.white.withOpacity(0.9)),
                            ),
                            Text(
                              "暂未开始记录哦～",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white.withOpacity(0.6)),
                            )
                          ],
                        )
                      ],
                    ),
                    IconButton(
                        onPressed: () {
                          callback();
                        },
                        icon: const Icon(RemixIcon.close, color: Colors.white,))
                  ],
                ),
              ),
              body: CustomScrollView(
                shrinkWrap: true,
                controller: logic.state.scrollController.value,
                slivers: [
                  SliverAppBar(
                    leading: const SizedBox.shrink(),
                    backgroundColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                    leadingWidth: 0,
                    expandedHeight: 240,
                    toolbarHeight: 0,
                    pinned: true,
                    collapsedHeight: 100,
                    flexibleSpace: FlexibleSpaceBar(
                      titlePadding: EdgeInsets.zero,
                      title: Obx(() => _menuWrapper(logic)),
                      background: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: GridView(
                          shrinkWrap: true,
                          primary: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 1.2,
                                  mainAxisSpacing: 15),
                          children: [
                            InkWell(
                              child: Image.asset(
                                "assets/images/2x2.png",
                                width: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                            InkWell(
                              child: Image.asset(
                                "assets/images/Q4f.png",
                                width: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                            InkWell(
                              child: Image.asset(
                                "assets/images/2B9.png",
                                width: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                            InkWell(
                              child: Image.asset(
                                "assets/images/_vG.png",
                                width: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                            InkWell(
                              child: Image.asset(
                                "assets/images/0FJ.png",
                                width: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                            InkWell(
                              child: Image.asset(
                                "assets/images/q1w.png",
                                width: double.infinity,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                      child: _content("👂听～有趣的声音", _contentSound())),
                  SliverToBoxAdapter(
                      child: _content(
                          "👀看～附近人的日常",
                          _panelWrapper(Row(
                            children: [
                              _cardItem(),
                              _cardItem(),
                              _cardItem(),
                              _cardItem(),
                              _cardItem(),
                              _cardItem(),
                            ],
                          )))),
                  SliverToBoxAdapter(
                    child: _content("✌️刷～所有好玩瞬间", const SizedBox.shrink(),
                        bottom: true),
                  ),
                  SliverAppBar(
                    leading: const SizedBox.shrink(),
                    leadingWidth: 0,
                    floating: false,
                    pinned: true,
                    title: null,
                    backgroundColor: Colors.black,
                    surfaceTintColor: Colors.black,
                    toolbarHeight: 0,
                    bottom: TabBar(
                        labelColor: Colors.white,
                        labelStyle: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),
                        dividerHeight: 0,
                        unselectedLabelColor: Colors.white.withOpacity(0.6),
                        unselectedLabelStyle:
                        const TextStyle(color: Colors.black54),
                        tabAlignment: TabAlignment.start,
                        isScrollable: true,
                        indicatorWeight: 2,
                        automaticIndicatorColorAdjustment: true,
                        indicator: const BoxDecoration(),
                        onTap: (i) {},
                        controller: logic.tabController.value,
                        tabs: const [
                          Tab(
                            child: Text(
                              '推荐',
                            ),
                          ),
                          Tab(
                            child: Text(
                              '视频',
                            ),
                          ),
                          Tab(
                            child: Text(
                              '直播',
                            ),
                          ),
                          Tab(
                            child: Text(
                              '科技数码',
                            ),
                          ),
                          Tab(
                            child: Text(
                              '机车',
                            ),
                          ),
                          Tab(
                            child: Text(
                              '旅行',
                            ),
                          ),
                          Tab(
                            child: Text(
                              '美食',
                            ),
                          ),
                          Tab(
                            child: Text(
                              '科学科普',
                            ),
                          ),
                          Tab(
                            child: Text(
                              '穿搭',
                            ),
                          ),
                        ]),
                  ),
                  SliverFillRemaining(
                    child: ExtendedTabBarView(
                      shouldIgnorePointerWhenScrolling: false,
                      controller: logic.tabController.value,
                      link: true,
                      children: const [
                        SendMorePage(),
                        SendMorePage(),
                        SendMorePage(),
                        SendMorePage(),
                        SendMorePage(),
                        SendMorePage(),
                        SendMorePage(),
                        SendMorePage(),
                        SendMorePage(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _menuWrapper(SendLogic logic) {
    return Container(
      color:
          logic.state.opacity.value == 1.0 ? Colors.black : Colors.transparent,
      key: logic.state.menuGlobalKey.value,
      alignment: Alignment.topCenter,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          _menuItem("assets/images/xf6.png", "语音", logic),
          const SizedBox(width: 30),
          _menuItem("assets/images/xVj.png", "日签", logic),
          const SizedBox(width: 30),
          _menuItem("assets/images/xXW.png", "打卡", logic),
          const SizedBox(width: 30),
          _menuItem("assets/images/vl0.png", "文字", logic),
          const SizedBox(width: 30),
          _menuItem("assets/images/ToP.png", "拍摄", logic),
        ],
      ),
    );
  }

  Widget _menuItem(String picture, String text, SendLogic logic) {
    return Expanded(
        child: AnimatedOpacity(
      duration: const Duration(milliseconds: 300),
      opacity: logic.state.opacity.value,
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage(picture)),
            Text(
              text,
              style: const TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    ));
  }

  Widget _content(String text, Widget widget, {bool bottom = true}) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: bottom ? 10 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
          widget,
        ],
      ),
    );
  }

  Widget _panelWrapper(Widget widget) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: widget,
    );
  }

  Widget _contentSound() {
    return _panelWrapper(Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          children: [
            _contentSoundItem("你要有使自己开心的能力"),
            _contentSoundItem("前端开发的天花板是前端组长，真扎心"),
            _contentSoundItem("掘金这排序，就跟闹着玩似的"),
            _contentSoundItem(
                "这个布局咋写啊？？？我自己想了想 flex 不行呀，瀑布流布局也不行啊 因为瀑布流布局是 等宽不等高的，这里面 每个item的 宽度都不一样。。。。"),
            _contentSoundItem("海鸣威/吴琼《老人与海》"),
            _contentSoundItem("这才十月份，就开始声讨明年2月份的春节放假！太超前了吧！！！"),
            _contentSoundItem("语雀打不开了？502？"),
          ],
        ),
        Wrap(
          children: [
            _contentSoundItem("好消息明年春节放8天，坏消息除夕不放假"),
            _contentSoundItem("重复的事情每天做"),
            _contentSoundItem("美好的假期又结束了"),
            _contentSoundItem("今天下午的比赛可以可以"),
            _contentSoundItem("谢谢你，点赞侠"),
            _contentSoundItem("算法岗也这么卷啊"),
            _contentSoundItem("有人穿棉衣，有人穿短袖"),
          ],
        ),
        Wrap(
          children: [
            _contentSoundItem("语雀崩了！！！"),
            _contentSoundItem("是谁抽到了「掘金好朋友礼盒」我不说"),
            _contentSoundItem("周末没事在家自制烤鱼"),
            _contentSoundItem("居然不是谢谢参与?? 然后这是个什么"),
            _contentSoundItem("谁说坚持没有意义的，看，它都发芽咯"),
            _contentSoundItem("不知道该嘲笑自己，还是觉得人生就是这样，不在期待的事情，又回来了。"),
            _contentSoundItem("人生中第一次外包经历到此结束..............哦耶"),
          ],
        ),
      ],
    ));
  }

  Widget _contentSoundItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, right: 10),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    image: AssetImage("assets/images/YAj.png"))),
          ),
          Container(
            height: 30,
            padding: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                )),
            child: Row(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 4),
                      child: Icon(
                        RemixIcon.voiceprint_outline,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    ConstrainedBox(
                      constraints:
                          const BoxConstraints(maxWidth: 300, minWidth: 100),
                      child: Text(text,
                          style: const TextStyle(
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis)),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10, right: 6),
                  child: Icon(
                    RemixIcon.arrow_right_s_outline,
                    color: Colors.white,
                    size: 16,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _cardItem() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        children: [
          Container(
            height: 160,
            width: 120,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/70k.png"))),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IntrinsicWidth(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(20)),
                      child: const Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 4),
                            child: Icon(
                              RemixIcon.map_pin,
                              size: 10,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "0.3km",
                            style: TextStyle(
                                color: Colors.white, fontSize: 12, height: 1),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Column(
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage("assets/images/YAj.png"),
                        radius: 20,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4, left: 10, right: 10),
                        child: Text(
                          "一尾流莺一尾流莺一尾流莺一尾流莺",
                          style: TextStyle(
                              color: Colors.white, height: 1, fontSize: 12),
                          overflow: TextOverflow.ellipsis,
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
    );
  }
}
