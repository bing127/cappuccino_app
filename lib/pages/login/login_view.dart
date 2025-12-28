import 'package:cappuccino/components/gesture_detector_view.dart';
import 'package:cappuccino/constants/colors.dart';
import 'package:cappuccino/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'login_logic.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LoginLogic(),
      assignId: true,
      builder: (LoginLogic logic) {
        return GestureDetectorView(child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      child: Text(
                        "帮助",
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 100),
                    child: Text(
                      "此刻",
                      style: GoogleFonts.zcoolKuaiLe(
                          fontSize: 53,
                          color: BasicColor.mainColor,
                          fontWeight: FontWeight.w900),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(
                      "记录美好时刻",
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.3),
                          letterSpacing: 6),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Get.width / 9.6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 60),
                      child: Center(
                        child: Text(
                          "+86 13800 **** 1111",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.8),
                              fontSize: 20),
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(46),
                      child: Material(
                        color: BasicColor.mainColor,
                        child: InkWell(
                          onTap: logic.goToHome,
                          child: Container(
                            color: Colors.transparent,
                            alignment: Alignment.center,
                            height: 46,
                            width: double.infinity,
                            child: const Text(
                              "一键登录",
                              style:
                              TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(46),
                        child: Material(
                          color: const Color(0xff333333).withOpacity(0.11),
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              color: Colors.transparent,
                              alignment: Alignment.center,
                              height: 46,
                              width: double.infinity,
                              child: Wrap(
                                spacing: 6,
                                alignment: WrapAlignment.center,
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  const Icon(
                                    RemixIcon.wechat,
                                    color: Color(0xff07c160),
                                  ),
                                  Text(
                                    "微信登录",
                                    style: TextStyle(
                                        color: Colors.black.withOpacity(0.8),
                                        fontSize: 16),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      alignment: Alignment.center,
                      child: TextButton(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "其他登录方式",
                              style: TextStyle(
                                  color: Colors.grey
                              ),
                            ),
                            Icon(
                                RemixIcon.arrow_right_s_outline,
                                color: Colors.grey.withOpacity(0.6)
                            )
                          ],
                        ),
                        onPressed: () {
                          Get.toNamed("${Routes.login}${Routes.otherLogin}");
                        },
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 80),
                      child: RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                              text: "",
                              style:
                              const TextStyle(color: Colors.grey, fontSize: 12),
                              children: [
                                WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Icon(RemixIcon.checkbox_blank_circle_outline, color: Colors.grey.withOpacity(0.46), size: 18)
                                ),
                                const TextSpan(
                                    text: "我已阅读并同意",
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 12)),
                                const TextSpan(
                                    text: "《用户协议》",
                                    style: TextStyle(
                                        color: Color(0xff29406b),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12)),
                                const TextSpan(
                                    text: "《隐私政策》",
                                    style: TextStyle(
                                        color: Color(0xff29406b),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12)),
                                const TextSpan(
                                    text: "《儿童/青少年个人信息保护规则》",
                                    style: TextStyle(
                                        color: Color(0xff29406b),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12)),
                                const TextSpan(
                                    text: "《中国移动认证服务条款》",
                                    style: TextStyle(
                                        color: Color(0xff29406b),
                                        fontWeight: FontWeight.w900,
                                        fontSize: 12)),
                              ])),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
      },
    );
  }
}
