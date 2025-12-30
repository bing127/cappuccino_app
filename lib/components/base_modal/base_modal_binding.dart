import 'package:get/get.dart';

import 'base_modal_logic.dart';

class BaseModalBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BaseModalLogic());
  }
}
