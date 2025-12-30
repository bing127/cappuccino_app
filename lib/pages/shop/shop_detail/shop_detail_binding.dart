import 'package:get/get.dart';

import 'shop_detail_logic.dart';

class ShopDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ShopDetailLogic());
  }
}
