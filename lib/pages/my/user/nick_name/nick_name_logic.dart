import 'package:cappuccino/api/user_api.dart';
import 'package:cappuccino/bean/user_info_bean.dart';
import 'package:cappuccino/constants/keys.dart';
import 'package:cappuccino/pages/frame/frame_logic.dart';
import 'package:cappuccino/pages/my/my_logic.dart';
import 'package:cappuccino/pages/my/user/user_logic.dart';
import 'package:cappuccino/utils/storage.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

import 'nick_name_state.dart';

class NickNameLogic extends GetxController {
  final NickNameState state = NickNameState();

  @override
  void onReady() {
    state.textEditingController.value.text = Get.arguments["value"];
    super.onReady();
  }

  void save() {
    if(state.textEditingController.value.text.isEmpty) {
      showToast("昵称不能未空");
      return;
    }
    FocusManager.instance.primaryFocus?.unfocus();
    UserApi.updateUser(Get.arguments["id"].toString(),{
      "nick_name": state.textEditingController.value.text
    }).then((value) {
      value?.user?.ksId = Utils.getQrCode(value.user!.id as int);
      Get.find<FrameLogic>().state.userInfo.value = value!;
      Get.find<UserLogic>().state.userInfo.value = value!;
      Get.find<MyLogic>().updateInfo(value);
      JSpUtil.setJSON(CachedLocalKeyDict.userInfo, value);
      showToast("昵称保存成功");
      Future.delayed(const Duration(seconds: 1), () {
         Get.back();
      });
    });
  }

  @override
  void dispose() {
    state.textEditingController.value.dispose();
    super.dispose();
  }
}
