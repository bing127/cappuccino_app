import 'package:get/get.dart';

import 'shop_logic.dart';

class ShopBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShopLogic());
  }
}
