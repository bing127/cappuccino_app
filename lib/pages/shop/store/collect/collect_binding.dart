import 'package:get/get.dart';

import 'collect_logic.dart';

class CollectBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CollectLogic());
  }
}
