import 'package:get/get.dart';

import 'send_logic.dart';

class SendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SendLogic());
  }
}
