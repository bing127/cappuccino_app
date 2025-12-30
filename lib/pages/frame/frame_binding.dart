import 'package:cappuccino/pages/home/home_logic.dart';
import 'package:cappuccino/pages/message/message_logic.dart';
import 'package:cappuccino/pages/my/my_logic.dart';
import 'package:cappuccino/pages/shop/shop_logic.dart';
import 'package:get/get.dart';

import 'frame_logic.dart';

class FrameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FrameLogic());
    Get.lazyPut(() => HomeLogic());
    Get.lazyPut(() => ShopLogic());
    Get.lazyPut(() => MessageLogic());
    Get.lazyPut(() => MyLogic());
  }
}
