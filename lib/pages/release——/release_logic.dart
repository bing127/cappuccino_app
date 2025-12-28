import 'package:get/get.dart';

import 'release_state.dart';

class ReleaseLogic extends GetxController {
  final ReleaseState state = ReleaseState();

  setPageIndex(int index) {
    state.currentIndex.value = index;
    state.pageController.value.jumpToPage(index);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
