import 'package:cappuccino/pages/home/video_detail/video_view/video_view_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'video_detail_logic.dart';

class VideoDetailPage extends StatelessWidget {
  const VideoDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<VideoDetailLogic>();
    final state = Get.find<VideoDetailLogic>().state;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Obx(() => PageView(
          scrollDirection: Axis.vertical,
          allowImplicitScrolling: false,
          controller: state.pageController.value,
          onPageChanged: logic.pageChange,
          children: state.videoList.asMap().keys.map((e) {
            return VideoViewPage(play: state.currentIndex.value == e, tag: state.videoList[e].tag, path: state.videoList[e].path, poster: state.videoList[e].poster);
          }).toList(),
        )),
    );
  }
}
