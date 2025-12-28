import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomCommentGroupState {
  final Rx<TextEditingController> textController = TextEditingController().obs;
  final Rx<FocusNode> textFocusNode = FocusNode().obs;
  final RxDouble keyboardHeight = 0.0.obs;
  BottomCommentGroupState() {
    ///Initialize variables
  }
}
