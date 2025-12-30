import 'package:cappuccino/bean/user_info_bean.dart';
import 'package:cappuccino/constants/keys.dart';
import 'package:cappuccino/pages/login/login_view.dart';
import 'package:cappuccino/utils/request/http.dart';
import 'package:cappuccino/utils/request/response.dart';
import 'package:cappuccino/utils/storage.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:oktoast/oktoast.dart';

class AccountApi {
  static Future<BaseResponse> appLogin(String loginName, String password) async {
    return await HttpUtil().post('/api/v1/account/app_login', data: <String,String>{
      'username': loginName,
      'password': password,
    },loading: true);
  }

  // 刷新token
  static Future<BaseResponse> refreshUserToken() async {
    String? refreshToken = JSpUtil.getString(CachedLocalKeyDict.authRefreshToken);
    if(refreshToken!.isEmpty) {
      EasyLoading.dismiss();
      JSpUtil.clear();
      Get.offAll(const LoginPage(), transition: Transition.circularReveal, duration:  Duration.zero);
      return BaseResponse(msg: '');
    }
    return await HttpUtil().post('/api/v1/account/refresh_token', data: <String,String?>{
      'refresh_token': JSpUtil.getString(CachedLocalKeyDict.authRefreshToken),
    },loading: true);
  }


  static Future<UserInfoBean> getUserInfo() async {
    BaseResponse res = await HttpUtil().get('/api/v1/auth/account/getInfo',loading: true);
    if(res.success == false) {
      showToast(res.msg);
      return UserInfoBean();
    }
    showToast("登录成功", duration: const Duration(milliseconds: 800));
    return UserInfoBean.fromJson(res.data);
  }
}
