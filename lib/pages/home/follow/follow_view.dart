import 'package:cappuccino/components/cache_widget.dart';
import 'package:cappuccino/components/card_item.dart';
import 'package:cappuccino/components/follow_item.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import 'follow_logic.dart';

class FollowPage extends StatelessWidget {
  const FollowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: FollowLogic(),
      assignId: true,
      builder: (FollowLogic logic) {
          return CacheWidget(child: SmartRefresher(
              controller: logic.state.refreshController.value,
              enablePullUp: true,
              header: const WaterDropHeader(),
              child: ListView(
                children: [
                  FollowItem(
                    id: Utils.uuid(),
                    like: 12,
                    username: "小哈哈呀",
                    path: "https://sns-video-bd.xhscdn.com/stream/110/258/01e53621ac0ab08f010370038b5b73efc9_258.mp4",
                    picture: "http://sns-webpic-qc.xhscdn.com/202311242140/9af7fc040013b41c09fcb0c3d6d604ef/1040g2sg30rrijbl12k1049rqip41dd2npqa42oo!nc_n_webp_mw_1",
                    cardType: CardType.video,
                    dateTime: '2023-10-21 09:23:06',
                    collect: 26,
                    comment: 836,
                    text: '想要的就要得到 这才是我的人生',
                    avatar: "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
                  ),
                  FollowItem(
                    id: Utils.uuid(),
                    picture: "https://sns-img-qc.xhscdn.com/20547301-e4f0-972b-e6ff-8e924e4cb527",
                    avatar: "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
                    like: 12,
                    cardType: CardType.text,
                    username: "小哈哈呀",
                    text: '"部分水解奶粉必须长期喝|亲测才有说服力',
                    dateTime: '2023-10-21 09:23:06',
                    collect: 26,
                    comment: 836,
                  ),
                  FollowItem(
                    cardType: CardType.video,
                    id: Utils.uuid(),
                    dateTime: '2023-10-21 09:23:06',
                    collect: 26,
                    comment: 836,
                    path: "https://sns-video-hw.xhscdn.net/stream/110/258/01e54cd696af79dc010370038bb427eb8a_258.mp4",
                    picture: "http://sns-webpic-qc.xhscdn.com/202311100100/5321ed64c6b637cff05efd369628f9e6/1040g00830r8nf1jbha004bumi4g65e8m6kqrkj8!nd_whgt34_webp_wm_1",
                    avatar: "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
                    like: 12,
                    username: "小哈哈呀",
                    text: '这路为什么会修到山顶上去了，这是通往何处呢？悬崖峭壁上的风景 人间仙境美如画',
                  ),
                  FollowItem(
                    id: Utils.uuid(),
                    dateTime: '2023-10-21 09:23:06',
                    collect: 26,
                    comment: 836,
                    picture: "https://sns-img-bd.xhscdn.com/2ab4d0bc-9c76-15b0-6f80-18192b112956",
                    avatar: "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
                    like: 12,
                    username: "小哈哈呀",
                    text: '这路为什么会修到山顶上去了，这是通往何处呢？悬崖峭壁上的风景 人间仙境美如画',
                  ),
                  FollowItem(
                    id: Utils.uuid(),
                    dateTime: '2023-10-21 09:23:06',
                    collect: 26,
                    comment: 836,
                    picture: "https://sns-img-bd.xhscdn.com/7c010f1b-2368-9c86-dfc7-58006828a0f3",
                    avatar: "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
                    like: 12,
                    username: "小哈哈呀",
                    text: '被眼前的一幕震撼到了',
                  ),
                  FollowItem(
                    id: Utils.uuid(),
                    dateTime: '2023-10-21 09:23:06',
                    collect: 26,
                    comment: 836,
                    picture: "https://sns-img-hw.xhscdn.net/be2186b9-d5ae-7d60-3aaa-fab4710d9f0a",
                    avatar: "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
                    like: 12,
                    username: "小哈哈呀",
                    text: '扮演的女特工气质很十足，影视拍摄花絮拍戏现场',
                  ),
                  FollowItem(
                    id: Utils.uuid(),
                    dateTime: '2023-10-21 09:23:06',
                    collect: 26,
                    comment: 836,
                    picture: "https://sns-img-hw.xhscdn.net/fabfa1a2-d4d8-480c-7c78-5647a75732d9",
                    avatar: "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
                    like: 12,
                    username: "小哈哈呀",
                    text: '有人看过这部神剧吗❗❓后劲太大了❗',
                  ),
                ],
              ),
              onRefresh: () async {
                await Future.delayed(const Duration(milliseconds: 1000));
                logic.state.refreshController.value.refreshCompleted();
              },
              onLoading: () async {
                await Future.delayed(const Duration(milliseconds: 1000));
                // logic.state.refreshController.value.loadComplete();
                logic.state.refreshController.value.loadNoData();
              }
          ));
      },
    );
  }
}
