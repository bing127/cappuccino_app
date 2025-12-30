import 'package:cappuccino/components/chat_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'message_detail_state.dart';

class MessageDetailLogic extends GetxController {
  final MessageDetailState state = MessageDetailState();

  void submit(String text, { ChatType? type}) {
    state.chartData.value = [
      ChatModel(target: ChatUser.sender,
          text: text,
          type: type == null ? ChatType.text : ChatType.picture,
          avatar:
          "https://sns-img-qc.xhscdn.com/86a87995-f041-a158-d44d-2e7947e154ac",
          user: "哈哈哈"
      ), ...state.chartData];
    toBottom();
  }

  void toBottom() {
    WidgetsBinding.instance.addPostFrameCallback((v) {
      if(state.scrollController.value.positions.isNotEmpty) {
        state.scrollController.value.animateTo(0, curve: Curves.easeOutQuart, duration: const Duration(milliseconds: 100));
      }
    });
  }
}
