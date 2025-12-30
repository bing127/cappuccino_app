import 'package:get/get.dart';

import 'video_view_logic.dart';

class VideoViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoViewLogic());
  }
}
