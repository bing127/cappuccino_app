import 'package:cappuccino/components/gesture_detector_view.dart';
import 'package:cappuccino/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'profile_logic.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ProfileLogic>();
    final state = Get.find<ProfileLogic>().state;

    return GestureDetectorView(
      child: SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          backgroundColor: const Color(0xfff3f3f3),
          appBar: AppBar(
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Colors.white,
            surfaceTintColor: Colors.white,
            automaticallyImplyLeading: false,
            leading: TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text("取消", style: TextStyle(
                    color: Colors.black.withOpacity(0.6)
                ),)
            ),
            title: Text(
              "编辑简介",
              style: GoogleFonts.roboto(fontSize: 16),
            ),
            actions: [
              TextButton(
                  onPressed: logic.save,
                  child: Text("保存", style: TextStyle(
                      color: BasicColor.mainColor
                  ),)
              )
            ],
          ),
          body: Container(
            margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 10
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6)
              ),
              padding: const EdgeInsets.only(
                left: 6,
                right: 6,
                bottom: 6,
              ),
              child: TextField(
                controller: state.textEditingController.value,
                maxLength: 120,
                maxLines: null,
                minLines: null,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                       vertical: 6
                    ),
                    hintText: '一句话简单介绍下自己',
                    hintStyle: TextStyle(
                       color: Colors.black.withOpacity(0.3)
                    ),
                    constraints: const BoxConstraints(
                        maxHeight: 300,
                        minHeight: 56
                    ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
