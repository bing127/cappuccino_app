import 'package:get/get.dart';

import 'no_found_logic.dart';

class NoFoundBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoFoundLogic());
  }
}
