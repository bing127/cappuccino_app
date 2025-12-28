import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import 'search_state.dart';

class SearchLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final SearchState state = SearchState();
  late Rx<AnimationController> animationController;

  @override
  void onInit() {
    animationController = AnimationController(vsync: this,  duration: const Duration(seconds: 1),).obs;
    Tween(begin: 0.0, end: 1.0).animate(animationController.value);
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    state.searchTextEditingController.value.addListener(() {
       state.isClear.value = state.searchTextEditingController.value.text.isNotEmpty;
    });
  }

  void suffixTap() {
     if(state.isClear.value) {
        state.searchTextEditingController.value.text = "";
     } else {

     }
  }

  void textRefresh() {
    animationController.value.repeat();
    Future.delayed(const Duration(seconds: 3), () {
      animationController.value.stop();
    });
  }

  @override
  void onClose() {
    state.searchTextEditingController.value.dispose();
    animationController.value.dispose();
    super.onClose();
  }
}
