import 'package:get/get.dart';

import 'now_logic.dart';

class NowBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NowLogic());
  }
}
