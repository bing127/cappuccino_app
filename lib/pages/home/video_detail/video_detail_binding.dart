import 'package:get/get.dart';

import 'video_detail_logic.dart';

class VideoDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoDetailLogic());
  }
}
