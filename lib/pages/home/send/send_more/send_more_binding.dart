import 'package:get/get.dart';

import 'send_more_logic.dart';

class SendMoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SendMoreLogic());
  }
}
