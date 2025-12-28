import 'package:get/get.dart';

import 'business_logic.dart';

class BusinessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BusinessLogic());
  }
}
