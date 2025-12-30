import 'package:get/get.dart';

import 'chat_input_logic.dart';

class ChatInputBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChatInputLogic());
  }
}
