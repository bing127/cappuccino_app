import 'package:get/get.dart';

import 'capture_logic.dart';

class CaptureBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CaptureLogic());
  }
}
