import 'package:cappuccino/pages/frame/frame_logic.dart';
import 'package:get/get.dart';

import 'release_state.dart';

class ReleaseLogic extends GetxController {
  final ReleaseState state = ReleaseState();

  @override
  void onReady() {
    _getPlace();
    super.onReady();
  }

  void _getPlace() async {
    state.placeList.value = Get.find<FrameLogic>().state.placeList;
  }

  @override
  void onClose() {
    state.titleController.value.dispose();
    state.contentController.value.dispose();
    state.assetsList.value = [];
    super.onClose();
  }
}
