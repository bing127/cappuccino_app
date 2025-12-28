import 'package:cappuccino/bean/user_info_bean.dart';
import 'package:cappuccino/utils/request/http.dart';
import 'package:cappuccino/utils/request/response.dart';
import 'package:oktoast/oktoast.dart';

class UserApi {
  // 更新用户信息
  static Future<UserInfoBean?> updateUser(String userId, Map params) async {
    BaseResponse res = await HttpUtil().put('/api/v1/auth/user/basicInfo/$userId', data: params, loading: true);
    if(res.success == true) {
      return UserInfoBean.fromJson({
        'user': res.data
      });
    } else {
      showToast(res.msg);
    }
    return null;
  }
}