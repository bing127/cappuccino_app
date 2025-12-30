import 'package:get/get.dart';

import 'find_logic.dart';

class FindBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FindLogic());
  }
}
