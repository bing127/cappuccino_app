import 'package:get/get.dart';

import 'release_logic.dart';

class ReleaseBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReleaseLogic());
  }
}
