import 'package:get/get.dart';

import 'video_comment_logic.dart';

class VideoCommentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VideoCommentLogic());
  }
}
