import 'package:cappuccino/components/cache_widget.dart';
import 'package:cappuccino/components/card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import 'local_logic.dart';

class LocalPage extends StatelessWidget {
  const LocalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LocalLogic(),
      assignId: true,
      builder: (LocalLogic logic) {
        return CacheWidget(child: SmartRefresher(
            controller: logic.state.refreshController.value,
            enablePullUp: true,
            header: const WaterDropHeader(),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: StaggeredGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: const [
                  CardItem(
                    pictureType: PictureType.network,
                    picture: "https://sns-img-qc.xhscdn.com/0f92480d-f347-7dc9-006b-32c913cd5bee",
                    avatar: "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
                    like: 12,
                    username: "",
                    text: '"部分水解奶粉必须长期喝|亲测才有说服力',
                  ),
                  CardItem(
                    pictureType: PictureType.network,
                    picture: "https://sns-img-bd.xhscdn.com/d27e224b-403f-3eb7-e7a5-e7e55e2a27c4",
                    like: 12,
                    username: "",
                    text: '想要的就要得到 这才是我的人生',
                    avatar: "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
                  ),
                  CardItem(
                    pictureType: PictureType.network,
                    picture: "https://sns-img-bd.xhscdn.com/2ab4d0bc-9c76-15b0-6f80-18192b112956",
                    avatar: "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
                    like: 12,
                    username: "",
                    text: '这路为什么会修到山顶上去了，这是通往何处呢？悬崖峭壁上的风景 人间仙境美如画',
                  ),
                  CardItem(
                    pictureType: PictureType.network,
                    picture: "https://sns-img-bd.xhscdn.com/7c010f1b-2368-9c86-dfc7-58006828a0f3",
                    avatar: "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
                    like: 12,
                    username: "",
                    text: '被眼前的一幕震撼到了',
                  ),
                  CardItem(
                    pictureType: PictureType.network,
                    picture: "https://sns-img-hw.xhscdn.net/be2186b9-d5ae-7d60-3aaa-fab4710d9f0a",
                    avatar: "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
                    like: 12,
                    username: "",
                    text: '扮演的女特工气质很十足，影视拍摄花絮拍戏现场',
                  ),
                  CardItem(
                    pictureType: PictureType.network,
                    picture: "https://sns-img-hw.xhscdn.net/fabfa1a2-d4d8-480c-7c78-5647a75732d9",
                    avatar: "https://sns-avatar-qc.xhscdn.com/avatar/61463fdb250bfabbf017a6e2.jpg?imageView2/2/w/60/format/webp|imageMogr2/strip",
                    like: 12,
                    username: "",
                    text: '有人看过这部神剧吗❗❓后劲太大了❗',
                  ),
                ],
              ),
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
