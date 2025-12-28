import 'package:get/get.dart';

import 'like_logic.dart';

class LikeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LikeLogic());
  }
}
