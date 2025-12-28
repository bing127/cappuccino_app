import 'dart:convert';

import 'package:cappuccino/pages/message/message_detail/message_detail_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'chat_input_state.dart';

class ChatInputLogic extends GetxController with GetSingleTickerProviderStateMixin {
  final ChatInputState state = ChatInputState();
  late final Rx<TabController> expressionTabController;
  bool isFocusListened = false;

  @override
  void onInit() {
    super.onInit();
    expressionTabController = TabController(length: 3, vsync: this).obs;
    state.textFocusNode.value.addListener(() {
        if(state.textFocusNode.value.hasFocus) {
          state.expansion.value = false;
          state.expression.value = false;
          Get.find<MessageDetailLogic>().toBottom();
        }
    });
    getEmoji();
  }

  void getEmoji() async {
    var assets = await rootBundle.loadString('AssetManifest.json');
    Map json = jsonDecode(assets);
    state.smallRightList.value = json.keys.where((element) => element.startsWith("assets/small_right/")).toList() as List<String>;
  }

  void setText(String val) {
    final String text = state.textController.value.text;
     state.textController.value.text = '$text$val';
  }


  @override
  void onReady() {
    super.onReady();
  }

  String removeLastCharacter(String str) {
    if (str.isEmpty) {
      return str;
    }
    var characters = str.characters;
    var newString = characters.take(characters.length - 1).toString();
    return newString;
  }

  void emojiAction({bool? clear, bool? send}) {
    String text =  state.textController.value.text;
     if(clear == true) {
        state.textController.value.text = removeLastCharacter(text);
     }
     if(send == true) {
       state.textController.value.text = '';
       Get.find<MessageDetailLogic>().submit(text);
     }
  }

  void emojiPictureAction(String text) {
    // Get.find<MessageDetailLogic>().submit(text, type: ChatType.picture);
    // Get.find<MessageDetailLogic>().toBottom(isAnimated: true);
  }


  void setExpression() {
    state.expansion.value = false;
    state.expression.value = !state.expression.value;
    if(!state.expression.value) {
      setFocus(true);
    } else {
      setFocus(false);
    }
  }
  void setExpansion(void Function(bool isTrue) func) {
    state.expression.value = false;
    state.expansion.value = !state.expansion.value;
    if(!state.expansion.value) {
      setFocus(true);
    } else {
      setFocus(false);
    }
  }

  Future<void> setFocus(bool isFocus) async {
     if(isFocus) {
       FocusScope.of(Get.context as BuildContext).requestFocus(state.textFocusNode.value);
       Get.find<MessageDetailLogic>().toBottom();
     } else {
       state.textFocusNode.value.unfocus();
     }
  }

  @override
  void onClose() {
    super.onClose();
    state.textController.value.dispose();
    // expressionTabController.value.removeListener(() {});
    expressionTabController.value.dispose();
    // state.textFocusNode.value.removeListener(() {});
    state.textFocusNode.value.dispose();
  }
}
