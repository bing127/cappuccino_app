import 'package:cappuccino/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'theme_logic.dart';

class ThemePage extends StatelessWidget {
  const ThemePage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ThemeLogic>();
    final state = Get.find<ThemeLogic>().state;

    return SafeArea(
      top: false,
      bottom: false,
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
            "主题设置",
            style: TextStyle(fontSize: 16),
          ),
        ),
        body: ListView(
          children: [

          ],
        ),
      ),
    );
  }
}
