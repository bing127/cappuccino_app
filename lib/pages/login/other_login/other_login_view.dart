import 'package:cappuccino/components/gesture_detector_view.dart';
import 'package:cappuccino/constants/colors.dart';
import 'package:cappuccino/constants/login_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'other_login_logic.dart';

class OtherLoginPage extends StatelessWidget {
  const OtherLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<OtherLoginLogic>();
    final state = Get.find<OtherLoginLogic>().state;

    return SafeArea(
      top: false,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          centerTitle: true,
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                RemixIcon.arrow_left_s_outline,
                color: BasicColor.darkBgColor,
                size: 20,
              )),
          title: Text(
            "其他方式登录",
            style: TextStyle(fontSize: 16),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: GestureDetectorView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset("assets/images/logo_white.png", width: 160),
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Text(
                          "此刻",
                          style: TextStyle(
                              fontSize: 32, fontWeight: FontWeight.w900),
                        ),
                      )
                    ],
                  ),
                ),
                Obx(() => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _inputItem(
                            state.loginName.value, RemixIcon.user_3_outline,
                            helperText: "输入账号", showPassword: true),
                        _inputItem(state.password.value, RemixIcon.mail_outline,
                            showPassword: state.showPassword.value,
                            isPassword: true,
                            maxLength: state.loginType.value == LoginConstants.smsCode ? 6 : 30,
                            helperText:
                                "输入${state.loginType.value == LoginConstants.smsCode ? '验证码' : '密码'}",
                            suffix:
                                state.loginType.value == LoginConstants.password
                                    ? SizedBox(
                                  height: 40,
                                        child: TextButton(
                                          style: const ButtonStyle(
                                              overlayColor:
                                                  MaterialStatePropertyAll(
                                                      Colors.white)),
                                          onPressed: () {
                                            state.showPassword.value =
                                                !state.showPassword.value;
                                          },
                                          child: Icon(
                                              state.showPassword.value
                                                  ? RemixIcon.eye_outline
                                                  : RemixIcon.eye_close_outline,
                                              color: Colors.grey),
                                        ),
                                      )
                                    : SizedBox(
                                        height: 40,
                                        child: Stack(
                                          children: [
                                            TextButton(
                                              style: const ButtonStyle(
                                                  overlayColor:
                                                      MaterialStatePropertyAll(
                                                          Colors.white)),
                                              onPressed: () {},
                                              child: const Text("获取验证码"),
                                            ),
                                            Positioned(
                                              top: 6,
                                              bottom: 6,
                                              child: Container(
                                                width: 0.5,
                                                decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.6)),
                                              ),
                                            )
                                          ],
                                        ),
                                      )),
                      ],
                    )),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: const EdgeInsets.only(left: 30),
                  child: InkWell(
                    child: const Text("验证码登录", style: TextStyle(
                      color: Colors.grey
                    ),),
                    onTap: () {
                      if (state.loginType.value == LoginConstants.smsCode) {
                        state.showPassword.value = true;
                        state.loginType.value = LoginConstants.password;
                      } else {
                        state.showPassword.value = false;
                        state.loginType.value = LoginConstants.smsCode;
                      }
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    left: 30,
                    right: 30,
                    top: 100
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(46),
                    child: Material(
                      color: BasicColor.mainColor,
                      child: InkWell(
                        onTap: logic.login,
                        child: Container(
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          height: 46,
                          width: double.infinity,
                          child: const Text(
                            "立即登录",
                            style:
                            TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _inputItem(TextEditingController controller, IconData icon,
      {Widget? suffix, bool? isPassword = false, String? helperText, bool showPassword = false, int? maxLength = 11}) {
    return Container(
      alignment: Alignment.centerLeft,
      margin: const EdgeInsets.only(bottom: 20, left: 30, right: 30),
      // height: 46,
      child: Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            border:
                Border.all(color: Colors.grey.withOpacity(0.15), width: 0.8),
            borderRadius: BorderRadius.circular(30),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child:
                    Icon(icon, color: Colors.grey.withOpacity(0.6), size: 18),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  padding: EdgeInsets.zero,
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    maxLength: maxLength,
                    controller: controller,
                    autofocus: false,
                    autocorrect: true,
                    obscureText: showPassword != true ? true : false,
                    scrollPadding: EdgeInsets.zero,
                    cursorColor: BasicColor.mainColor,
                    keyboardType: isPassword == true ? TextInputType.emailAddress : TextInputType.phone,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: helperText,
                      counterText: '',
                      isDense: true,
                      alignLabelWithHint: true,
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
              ),
              suffix ?? const SizedBox.shrink()
            ],
          )),
    );
  }
}
