import 'package:get/get.dart';

import 'video_edit_logic.dart';

class VideoEditBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoEditLogic());
  }
}
