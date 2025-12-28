import 'package:cappuccino/bean/user_info_bean.dart';
import 'package:get/get.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class UserState {
  RxList<AssetEntity> avatar = <AssetEntity>[].obs;
  Rx<UserInfoBean> userInfo = UserInfoBean().obs;
  UserState() {
    ///Initialize variables
  }
}
