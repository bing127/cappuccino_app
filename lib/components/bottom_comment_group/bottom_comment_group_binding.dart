import 'package:get/get.dart';

import 'bottom_comment_group_logic.dart';

class BottomCommentGroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BottomCommentGroupLogic());
  }
}
