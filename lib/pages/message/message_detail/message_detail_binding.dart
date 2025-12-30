import 'package:get/get.dart';

import 'message_detail_logic.dart';

class MessageDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageDetailLogic());
  }
}
