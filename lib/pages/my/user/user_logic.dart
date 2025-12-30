import 'package:cappuccino/api/common_api.dart';
import 'package:cappuccino/api/user_api.dart';
import 'package:cappuccino/bean/user_info_bean.dart';
import 'package:cappuccino/constants/keys.dart';
import 'package:cappuccino/pages/frame/frame_logic.dart';
import 'package:cappuccino/pages/my/my_logic.dart';
import 'package:cappuccino/utils/storage.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:oktoast/oktoast.dart';

import 'user_state.dart';

class UserLogic extends GetxController {
  final UserState state = UserState();
  @override
  void onReady() {
    state.userInfo.value = Get.find<FrameLogic>().state.userInfo.value;
    super.onReady();
  }

  Future<void> cropImage(BuildContext context) async {
      final filePath = await state.avatar.first.file;
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: filePath!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 60,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: '头像裁剪',
              toolbarColor: Colors.black,
              toolbarWidgetColor: Colors.white,
              backgroundColor: Colors.black,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: true),
            IOSUiSettings(
              title: '头像裁剪',
              doneButtonTitle: '确定',
              cancelButtonTitle: '取消',
            ),
        ],
      );
      if (croppedFile != null) {
         var result = await CommonApi.uploadFile(croppedFile.path);
         if(result?.success == true) {
           var userId = Get.find<FrameLogic>().state.userInfo.value.user!.id as String;
           UserApi.updateUser(userId,
               {
                 'avatar': result?.data
               }).then((value) {
             value?.user?.ksId = Utils.getQrCode(value.user!.id as int);
             Get.find<FrameLogic>().state.userInfo.value = value!;
             Get.find<MyLogic>().updateInfo(value);
             state.userInfo.value = value;
             JSpUtil.setJSON(CachedLocalKeyDict.userInfo, value);
             showToast("修改头像成功");
           });
         } else {
            showToast(result!.msg);
         }
      }
  }
}
