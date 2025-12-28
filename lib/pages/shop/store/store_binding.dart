import 'package:get/get.dart';

import 'store_logic.dart';

class StoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StoreLogic());
  }
}
