import 'package:cappuccino/pages/login/login_logic.dart';
import 'package:get/get.dart';
import 'package:cappuccino/pages/frame/frame_logic.dart';

class GlobalBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FrameLogic());
    Get.lazyPut(() => LoginLogic());
  }
}