import 'package:cappuccino/bean/user_place_bean.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ReleaseState {
  final Rx<TextEditingController> titleController = TextEditingController().obs;
  final Rx<TextEditingController> contentController = TextEditingController().obs;
  final RxList<AssetEntity> assetsList = <AssetEntity>[].obs;
  final RxList<UserPlaceBean> placeList = <UserPlaceBean>[].obs;
  ReleaseState() {
    ///Initialize variables
  }
}
