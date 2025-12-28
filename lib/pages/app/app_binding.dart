import 'package:get/get.dart';

import 'app_logic.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppLogic());
  }
}
