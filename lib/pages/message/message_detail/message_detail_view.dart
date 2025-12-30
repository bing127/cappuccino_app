import 'package:cappuccino/components/chat_input/chat_input_view.dart';
import 'package:cappuccino/components/chat_item.dart';
import 'package:cappuccino/components/chat_model.dart';
import 'package:cappuccino/components/gesture_detector_view.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'message_detail_logic.dart';

class MessageDetailPage extends StatelessWidget {
  const MessageDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<MessageDetailLogic>();
    final state = Get.find<MessageDetailLogic>().state;

    return Material(
      color: const Color(0xfff2f2f2),
      child: SafeArea(
        top: false,
        child: GestureDetectorView(
          child: Scaffold(
            appBar: AppBar(
              surfaceTintColor: Colors.white,
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(RemixIcon.arrow_left_s_outline,
                    color: Colors.black.withOpacity(0.6)),
                onPressed: () {
                  Get.back();
                },
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(23),
                            child: Get.arguments != null && Get.arguments['avatar'] != null ? Utils.cachePicture(Get.arguments['avatar'],
                                width: 23, height: 23) : const SizedBox.shrink(),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            "${Get.arguments != null && Get.arguments['name'] != null ? Get.arguments['name'] : ''}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.8),
                                fontSize: 14),
                          )
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            RemixIcon.phone_outline,
                            color: Colors.black.withOpacity(0.8),
                            size: 18,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            RemixIcon.more_outline,
                            color: Colors.black.withOpacity(0.8),
                            size: 18,
                          ))
                    ],
                  ),
                ],
              ),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                    child: Obx(() => CustomScrollView(
                      reverse: true,
                      shrinkWrap: true,
                      controller: state.scrollController.value,
                      slivers: [
                        SliverList.builder(
                          itemCount: state.chartData.length,
                          itemBuilder: (_, index) {
                            return ChatItem(
                              target: state.chartData[index].target ?? ChatUser.sender,
                              text: state.chartData[index].text ?? '',
                              type: state.chartData[index].type ?? ChatType.text,
                              avatar: state.chartData[index].avatar,
                              user: state.chartData[index].user,
                            );
                          },
                        ),
                      ],
                    ),
                    )
                ),
                ChatInputPage(onSubmitted: (String text) {
                  logic.submit(text);
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
