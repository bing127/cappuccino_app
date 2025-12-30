import 'package:get/get.dart';

import 'template_logic.dart';

class TemplateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TemplateLogic());
  }
}
