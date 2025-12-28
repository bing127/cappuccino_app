import 'package:get/get.dart';

import 'album_logic.dart';

class AlbumBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AlbumLogic());
  }
}
