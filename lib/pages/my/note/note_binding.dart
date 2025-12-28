import 'package:get/get.dart';

import 'note_logic.dart';

class NoteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NoteLogic());
  }
}
