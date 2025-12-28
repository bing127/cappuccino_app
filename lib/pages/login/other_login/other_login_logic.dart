import 'package:cappuccino/api/account_api.dart';
import 'package:cappuccino/bean/user_info_bean.dart';
import 'package:cappuccino/constants/keys.dart';
import 'package:cappuccino/routes/app_routes.dart';
import 'package:cappuccino/utils/request/response.dart';
import 'package:cappuccino/utils/storage.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

import 'other_login_state.dart';

class OtherLoginLogic extends GetxController {
  final OtherLoginState state = OtherLoginState();

  void login() {
     String loginName = state.loginName.value.text;
     String password = state.password.value.text;
     if(loginName.isEmpty) {
       showToast("请输入手机号");
       return;
     }

      if(!isValidPhoneNumber(loginName)) {
        showToast("请输入正确的手机号");
        return;
      }

      if(password.isEmpty) {
        showToast("请输入密码");
        return;
      }
     AccountApi.appLogin(loginName, password).then((BaseResponse value) {
        if(value.success == true) {
          print(value.data['token']);
          JSpUtil.setString(CachedLocalKeyDict.authorization, value.data['token']);
          JSpUtil.setString(CachedLocalKeyDict.authRefreshToken, value.data['refreshToken']);
          AccountApi.getUserInfo().then((UserInfoBean value) {
            value.user?.ksId = Utils.getQrCode(value.user!.id as int);
            JSpUtil.setJSON(CachedLocalKeyDict.userInfo, value);
            Get.offAndToNamed(Routes.frame);
          });
        } else {
          showToast(value.msg);
        }
     });
  }
}


bool isValidPhoneNumber(String phoneNumber) {
  RegExp regExp = RegExp(r'^[1-9]\d{10}$');
  if (regExp.hasMatch(phoneNumber)) {
    return true;
  } else {
    return false;
  }
}
