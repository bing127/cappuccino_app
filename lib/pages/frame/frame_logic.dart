import 'package:cappuccino/api/common_api.dart';
import 'package:cappuccino/bean/user_info_bean.dart';
import 'package:cappuccino/constants/keys.dart';
import 'package:cappuccino/utils/storage.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'frame_state.dart';

class FrameLogic extends GetxController {
  final FrameState state = FrameState();

  setPageIndex(int index) {
    state.currentIndex.value = index;
    state.pageController.value.jumpToPage(index);
  }


  @override
  void onInit() {
    super.onInit();
  }
  @override
  void onReady() {
    setUserInfo();
    _getPlace();
    super.onReady();
  }

  void _getPlace() async {
    var data = await Geolocator.getCurrentPosition();
    var result = await CommonApi.get_api_v1_public_place(data.longitude, data.latitude);
    state.placeList.value = result!;
  }

  void setUserInfo() {
    var data = JSpUtil.getJSON(CachedLocalKeyDict.userInfo);
    if (data != null) {
      state.userInfo.value = UserInfoBean.fromJson(data);
    }
  }
}
