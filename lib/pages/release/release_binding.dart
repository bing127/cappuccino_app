import 'package:cappuccino/pages/release/video_edit/video_edit_logic.dart';
import 'package:get/get.dart';

import 'release_logic.dart';

class ReleaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReleaseLogic());
  }
}
