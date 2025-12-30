import 'package:get/get.dart';

enum LoginMode {
   phone,
   smsCode
}

class LoginState {
  late Rx<int> count = 6.obs;

  LoginState() {
    ///Initialize variables
  }
}
