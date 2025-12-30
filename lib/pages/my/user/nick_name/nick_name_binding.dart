import 'package:get/get.dart';

import 'nick_name_logic.dart';

class NickNameBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NickNameLogic());
  }
}
