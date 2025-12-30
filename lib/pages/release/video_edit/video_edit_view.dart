import 'dart:ffi';
import 'dart:io';

import 'package:cappuccino/bean/video_edit_bean.dart';
import 'package:cappuccino/components/video_edit/video_edit.dart';
import 'package:cappuccino/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:remix_icon_icons/remix_icon_icons.dart';
import 'package:video_editor/video_editor.dart';

import 'video_edit_logic.dart';

class VideoEditPage extends StatelessWidget {
  const VideoEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      assignId: true,
      initState: (GetBuilderState<VideoEditLogic>? state) {},
      init: VideoEditLogic(),
      builder: (VideoEditLogic logic) {
          return Container(
            color: Colors.black,
            child: Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                centerTitle: true,
                backgroundColor: Colors.black,
                surfaceTintColor: Colors.black,
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
                  "视频裁剪",
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.white
                  ),
                ),
              ),
              body: VideoEditor(
                file: Get.arguments['file'],
                exportCover: (File file) {
                    Get.back(result: VideoEditBean(
                         file: file,
                         type: 'cover'
                    ).toJson());
                },
                exportVideo: (File file) {
                  Get.back(result: VideoEditBean(
                      file: file,
                      type: 'video'
                  ).toJson());
                },
              ),
            ),
          );
      }
    );
  }
}
