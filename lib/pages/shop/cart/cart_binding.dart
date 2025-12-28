import 'package:get/get.dart';

import 'cart_logic.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CartLogic());
  }
}
