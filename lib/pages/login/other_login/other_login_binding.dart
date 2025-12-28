import 'package:get/get.dart';

import 'other_login_logic.dart';

class OtherLoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OtherLoginLogic());
  }
}
