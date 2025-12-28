import 'package:get/get.dart';

import 'area_logic.dart';

class AreaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AreaLogic());
  }
}
