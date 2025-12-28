import 'package:cappuccino/pages/home/video_detail/video_view/video_view_logic.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'video_detail_state.dart';

class VideoDetailLogic extends GetxController {
  final VideoDetailState state = VideoDetailState();

  void childPageInitialized(FijkPlayer player) async {
    await player.start();
  }


  void pageChange(int index) {
    try {
      final logic = Get.find<VideoViewLogic>(tag: state.videoList[state.currentIndex.value].tag);
      logic.state.player.value.pause();
      state.currentIndex.value = index;
      Get.find<VideoViewLogic>(tag: state.videoList[index].tag).state.player.value.start();
    } catch(err) {
       print(err);
    }
  }


  @override
  void onClose() {
    SystemChrome.setSystemUIOverlayStyle(Utils.dark);
    super.onClose();
  }
  
  
  @override
  void dispose() {
    state.pageController.value.dispose();
    super.dispose();
  }
}
