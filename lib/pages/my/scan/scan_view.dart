import 'package:cappuccino/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';
import 'package:scan/scan.dart';

import 'scan_logic.dart';

class ScanPage extends StatelessWidget {
  const ScanPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<ScanLogic>();
    final state = Get.find<ScanLogic>().state;

    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            ScanView(
              scanLineColor: BasicColor.mainColor,
              controller: state.scanKitController.value,
            ),
            Positioned(
              child: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                surfaceTintColor: Colors.transparent,
                centerTitle: true,
                automaticallyImplyLeading: false,
                leading: IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      RemixIcon.arrow_left_s_outline,
                      color: Colors.white,
                      size: 20,
                    )),
                title: Text(
                  "扫一扫",
                  style: GoogleFonts.roboto(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
            Positioned(
              left: (Get.width - Get.width * 0.7) / 2,
              top: (Get.height - Get.width * 0.7) / 2,
              child: Container(
                alignment: Alignment.bottomCenter,
                width: Get.width * 0.7,
                height: Get.width * 0.7,
                child: TextButton(
                  onPressed: () {
                    state.isFlash.value = !state.isFlash.value;
                    state.scanKitController.value.toggleTorchMode();
                  },
                  child: Obx(() => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(state.isFlash.value ? RemixIcon.lightbulb_flash_outline : RemixIcon.lightbulb_outline, color: Colors.white),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 6,
                        ),
                        child: Text("轻触${state.isFlash.value ? '关闭' : '照亮'}", style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13
                        ),),
                      )
                    ],
                  )),
                ),
              ),
            ),
            Positioned(
              left: (Get.width - Get.width * 0.7) / 2,
              top: (Get.height - Get.width * 0.7) / 2 + Get.width * 0.7 + 20,
              child: Container(
                alignment: Alignment.bottomCenter,
                width: Get.width * 0.7,
                child: const Text("请将二维码对准扫码框中心", style: TextStyle(
                  color: Colors.white
                ),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
