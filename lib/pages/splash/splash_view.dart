import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cappuccino/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'splash_logic.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SplashLogic(),
      assignId: true,
      builder: (SplashLogic logic) {
        return Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/70k.png"),
                  fit: BoxFit.fill)),
          width: Get.width,
          height: Get.height,
          padding: EdgeInsets.only(
            top: Get.mediaQuery.padding.top,
            bottom: Get.mediaQuery.padding.bottom,
          ),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.centerRight,
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 100, right: 30),
                    child: Container(
                      alignment: Alignment.center,
                      width: 146,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5), // 设置淡白色投影
                            blurRadius: 73,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(73),
                        child: Image.asset(
                          "assets/images/imt.png",
                          width: double.infinity,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Get.height / 6, left: 30),
                    width: 60,
                    child: Image.asset(
                      "assets/images/1d2d5b71-31f5-4ebf-b7d0-aefb0cd0653f.png",
                      fit: BoxFit.fill,
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 10,
                right: 30,
                child: TextButton(
                  onPressed: () {
                    logic.goToHome();
                  },
                  child: Obx(() => Text("${logic.state.secondsRemaining.value}s后跳过",
                      style: const TextStyle(color: Colors.white)),
                  )),
              ),
              Positioned(
                left: 30,
                right: 30,
                bottom: 100,
                child: Center(
                  child: FilledButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(BasicColor.mainColor)),
                    onPressed: logic.goToHome,
                    child: const Text("立即进入"),
                  ),
                ),
              ),
              Positioned(
                left: 30,
                right: 30,
                bottom: 20,
                child: Center(
                  child: AnimatedTextKit(
                    totalRepeatCount: 3,
                    animatedTexts: [
                      WavyAnimatedText('「 此刻说：有爱，才有家。 」',
                          textStyle: TextStyle(
                              fontSize: 18,
                              color: const Color(0xffffffff).withOpacity(0.6))),
                    ],
                    isRepeatingAnimation: true,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
