import 'package:cappuccino/pages/home/video_detail/video_detail_model.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoDetailState {
  late Rx<PageController> pageController;
  late RxList<VideoDetailModel> videoList = [
    VideoDetailModel(
        tag: Utils.uuid(),
        path: "https://sns-video-bd.xhscdn.com/stream/110/258/01e53621ac0ab08f010370038b5b73efc9_258.mp4",
        poster: "http://sns-webpic-qc.xhscdn.com/202311242140/9af7fc040013b41c09fcb0c3d6d604ef/1040g2sg30rrijbl12k1049rqip41dd2npqa42oo!nc_n_webp_mw_1",
        play: true
    ), VideoDetailModel(
        tag: Utils.uuid(),
        path: "https://sns-video-hw.xhscdn.net/stream/110/258/01e54cd696af79dc010370038bb427eb8a_258.mp4",
        poster: "http://sns-webpic-qc.xhscdn.com/202311100100/5321ed64c6b637cff05efd369628f9e6/1040g00830r8nf1jbha004bumi4g65e8m6kqrkj8!nd_whgt34_webp_wm_1",
        play: false
    ), VideoDetailModel(
        tag: Utils.uuid(),
        path: "https://sns-video-hw.xhscdn.net/stream/110/258/01e527aff210acd7010370038b2370f39d_258.mp4",
        poster: "http://sns-webpic-qc.xhscdn.com/202311100102/5ee8c349f337af1fd390050af58fc458/230e4af3d3b24a2db050c9f3b258cb41_ts!nd_whlt34_webp_wm_1",
        play: false
    )
  ].obs;
  RxInt currentIndex = 0.obs;

  VideoDetailState() {
    pageController = PageController(initialPage: 0, keepPage: false).obs;
  }
}
