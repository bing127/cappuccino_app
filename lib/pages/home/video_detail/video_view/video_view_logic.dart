import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'video_view_state.dart';

class VideoViewLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final VideoViewState state = VideoViewState();

  @override
  void onReady() {
    state.transitionAnimationController = AnimationController(vsync: this).obs;
    super.onReady();
  }

  @override
  void onClose() {
    if(state.player.value.state == FijkState.stopped) {
      state.player.value.release();
    }
    super.onClose();
  }
}
