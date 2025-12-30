import 'package:cappuccino/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:get/get.dart';

import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'bottom_comment_group_logic.dart';

enum CommentType {
   normal,
   video
}

class BottomCommentGroupPage extends StatelessWidget {
  final Brightness? brightness;
  final CommentType? commentType;
  final void Function()? commentFunc;
  const BottomCommentGroupPage({super.key, this.brightness = Brightness.light, this.commentType = CommentType.normal, this.commentFunc});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        assignId: true,
        initState: (GetBuilderState<BottomCommentGroupLogic>? state) {},
        init: BottomCommentGroupLogic(),
        builder: (BottomCommentGroupLogic logic) {
          return Container(
            color: brightness == Brightness.light ? Colors.white : Colors.black,
            height: 80,
            padding: EdgeInsets.only(
                bottom: Get.mediaQuery.padding.bottom, top: 6, left: 12, right: 12),
            child: Row(
              children: [
                Expanded(
                    child: InkWell(
                      child: commentType == CommentType.normal ?  Container(
                        height: 32,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6
                        ),
                        decoration: BoxDecoration(
                            color: brightness == Brightness.light ? BasicColor.lightBgColor : const Color(0xff333333),
                            borderRadius: BorderRadius.circular(40)),
                        child: Row(
                          children: [
                            const Icon(RemixIcon.edit_outline, size: 16),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 3
                              ),
                              child: Text(
                                "说点什么...",
                                style: TextStyle(
                                  color: brightness == Brightness.light ? BasicColor.darkBgColor.withOpacity(0.6) : Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ) :  Container(
                        decoration: BoxDecoration(
                            color: brightness == Brightness.light ? BasicColor.lightBgColor : const Color(0xff333333),
                            borderRadius: BorderRadius.circular(40)),
                        child: Row(
                          children: [
                            InkWell(
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  const SizedBox(
                                    width: 40,
                                    height: 30,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.white,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(4)),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 1, horizontal: 3),
                                    child: const Text(
                                      "弹",
                                      style: TextStyle(color: Colors.white, fontSize: 10),
                                    ),
                                  ),
                                  Positioned(
                                    right: 2,
                                    bottom: 2,
                                    child: Container(
                                      padding: const EdgeInsets.all(2),
                                      decoration: BoxDecoration(
                                          color: const Color(0xff333333),
                                          borderRadius: BorderRadius.circular(30)),
                                      child: Icon(
                                        RemixIcon.check,
                                        color: BasicColor.mainColor,
                                        size: 12,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 14,
                              padding: const EdgeInsets.only(left: 6),
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                  border: Border(
                                      left: BorderSide(color: Colors.grey, width: 1.3))),
                              child: const Text(
                                "发弹幕",
                                style: TextStyle(color: Colors.grey, height: 1),
                              ),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        _showInput(context, logic);
                      },
                    ),
                ),
                Row(
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              RemixIcon.heart_2_outline,
                              size: 20,
                              color: brightness == Brightness.light ? BasicColor.darkBgColor : Colors.white,
                            ),
                            Text(
                              "1.9万",
                              style: TextStyle(
                                color: brightness == Brightness.light ? BasicColor.darkBgColor : Colors.white,
                              ),
                            )
                          ],
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          children: [
                            Icon(
                              RemixIcon.star_outline,
                              size: 20,
                              color: brightness == Brightness.light ? BasicColor.darkBgColor : Colors.white,
                            ),
                            Text(
                              "2088",
                              style: TextStyle(
                                color: brightness == Brightness.light ? BasicColor.darkBgColor : Colors.white,
                              ),
                            )
                          ],
                        )),
                    TextButton(
                        onPressed: () {
                          if(commentFunc != null) {
                            commentFunc!();
                          }
                        },
                        child: Row(
                          children: [
                            Icon(
                              RemixIcon.message_3_outline,
                              size: 20,
                              color: brightness == Brightness.light ? BasicColor.darkBgColor : Colors.white,
                            ),
                            Text(
                              "2362",
                              style: TextStyle(
                                color: brightness == Brightness.light ? BasicColor.darkBgColor : Colors.white,
                              ),
                            )
                          ],
                        ))
                  ],
                )
              ],
            ),
          );
        }
    );
  }


  void _showInput(BuildContext context,BottomCommentGroupLogic logic) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: false,
        backgroundColor: Colors.transparent,
        builder: (BuildContext parentContext) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return KeyboardVisibilityBuilder(
                builder: (BuildContext visibilityContext, bool isKeyboardVisible) {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    logic.state.keyboardHeight.value = MediaQuery.of(visibilityContext).viewInsets.bottom;
                  });
                  return Obx(() => Container(
                    padding: EdgeInsets.only(
                      bottom: logic.state.keyboardHeight.value + 8,
                      left: 12,
                      right: 12,
                      top: 8
                    ),
                    decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(6),
                            topRight: Radius.circular(6)
                        )
                    ),
                    child: Row(
                      children: [
                        Expanded(child: LimitedBox(
                          maxHeight: 300,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(6),
                            child: TextField(
                              focusNode: logic.state.textFocusNode.value,
                              maxLines: null,
                              maxLength: 300,
                              autofocus: true,
                              autocorrect: true,
                              cursorColor: BasicColor.mainColor,
                              controller: logic.state.textController.value,
                              textInputAction: TextInputAction.send,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.text,
                              onChanged: (String text) {

                              },
                              onSubmitted: (String text) {
                                logic.state.textController.value.text = "";
                              },
                              onEditingComplete: () {

                              },
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.grey.withOpacity(0.1),
                                  hintText: "说点什么...",
                                  hintStyle: const TextStyle(fontSize: 14),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0, color: Colors.transparent)),
                                  disabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0, color: Colors.transparent)),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 0, color: Colors.transparent)),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  counterText: '',
                                  isDense: true,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 12)),
                            ),
                          ),
                        )),
                        InkWell(
                          child: Container(
                            width: 32,
                            height: 32,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 12
                            ),
                            child: const Icon(RemixIcon.image_outline),
                          ),
                        ),
                        FilledButton(onPressed: () {},  style: ButtonStyle(
                            backgroundColor:
                            MaterialStateProperty.all(BasicColor.mainColor)), child: Text("发送"))
                      ],
                    ),
                  ));
                },
              );
            },
          );
        });
  }
}
