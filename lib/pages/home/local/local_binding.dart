import 'package:get/get.dart';

import 'local_logic.dart';

class LocalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LocalLogic());
  }
}
