import 'package:camera/camera.dart';
import 'package:cappuccino/components/camera_view.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'capture_logic.dart';

class CapturePage extends StatelessWidget {
  final BuildContext parentContext;

  const CapturePage({super.key, required this.parentContext});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CaptureLogic(),
      assignId: true,
      builder: (CaptureLogic logic) {
        return Container(
          padding: EdgeInsets.only(top: Get.mediaQuery.padding.top),
          child: Scaffold(
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                CameraView(callback: (CameraController cameraController) {
                  SystemChrome.setSystemUIOverlayStyle(Utils.light);
                  print("$cameraController cameraControllercameraController");
                },),
                Positioned(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12
                    ),
                    height: kToolbarHeight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(parentContext).pop();
                            Future.delayed(const Duration(milliseconds: 300), () {
                              SystemChrome.setSystemUIOverlayStyle(Utils.dark);
                            });
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Icon(RemixIcon.close, color: Colors.white,),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 3,
                              horizontal: 8
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2)
                            ),
                            child: const Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 4,
                              children: [
                                Icon(RemixIcon.music_2_outline, color: Colors.white, size: 16,),
                                Text("选择音乐", style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14
                                ),)
                              ],
                            ),
                          ),
                        ),
                        const SizedBox.shrink()
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 12,
                  top: kToolbarHeight,
                  child: Column(
                    children: [
                      _toolItem("翻转", RemixIcon.refresh_outline, logic),
                      const SizedBox(
                        height: 16,
                      ),
                      _toolItem("滤镜", RemixIcon.palette_outline, logic),
                      const SizedBox(
                        height: 16,
                      ),
                      _toolItem("美颜", RemixIcon.emoji_sticker_outline, logic),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _toolItem(String text, IconData icon, CaptureLogic logic) {
    return InkWell(
      onTap: () {
      },
      child: Column(
          children: [
             Icon(
               icon,
               color: Colors.white,
               size: 20,
             ),
             Padding(
               padding: const EdgeInsets.only(
                 top: 3
               ),
               child: Text(text, style: const TextStyle(
                   color: Colors.white,
                  fontSize: 13
               ),),
             )
          ],
      ),
    );
  }
}
