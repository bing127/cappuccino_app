import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoViewState {
  final Rx<FijkPlayer> player = FijkPlayer().obs;
  final Rx<FijkState> playerState = FijkState.started.obs;
  late final RxDouble videoHeight = Get.height.obs;
  late final Rx<AnimationController> transitionAnimationController;
  VideoViewState() {
    ///Initialize variables
  }
}
