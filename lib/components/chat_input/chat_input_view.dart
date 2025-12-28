import 'package:cappuccino/components/chat_input/emoji_view.dart';
import 'package:cappuccino/constants/colors.dart';
import 'package:cappuccino/utils/permission.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'chat_input_logic.dart';

typedef FocusCallback = void Function(bool isFocus);
typedef HeightCallback = void Function(double height);

class ChatInputPage extends StatelessWidget {
  final void Function(String text)? onSubmitted;
  const ChatInputPage({super.key, this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      assignId: true,
      initState: (GetBuilderState<ChatInputLogic>? state) {},
      init: ChatInputLogic(),
      builder: (ChatInputLogic logic) {
        return Container(
          color: const Color(0xfff2f2f2),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  color: Colors.black.withOpacity(0.001),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _icon(RemixIcon.mic_outline, () {}),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(6)),
                          child: LimitedBox(
                            maxHeight: 300,
                            child: TextField(
                              focusNode: logic.state.textFocusNode.value,
                              maxLines: null,
                              maxLength: 300,
                              autofocus: false,
                              autocorrect: true,
                              cursorColor: BasicColor.mainColor,
                              controller: logic.state.textController.value,
                              textInputAction: TextInputAction.send,
                              textAlignVertical: TextAlignVertical.center,
                              keyboardType: TextInputType.text,
                              onSubmitted: (String text) {
                                onSubmitted!(text);
                                logic.state.textController.value.text = "";
                              },
                              onEditingComplete: () {
                              },
                              style: GoogleFonts.beVietnamPro(fontSize: 16),
                              decoration: InputDecoration(
                                  hintText: "发消息...",
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
                                      horizontal: 6, vertical: 12)),
                            ),
                          ),
                        ),
                      ),
                      _icon(RemixIcon.user_smile_outline, () {
                        logic.setExpression();
                      }),
                      const SizedBox(
                        width: 6,
                      ),
                      _icon(RemixIcon.add_circle_outline, () {
                        logic.setExpansion((bool isTrue) {

                        });
                      }),
                    ],
                  ),
                ),
                Obx(() => _panelBlock(_expression(logic, logic.state.expression.value ? 330 : 0 , context), logic.state.expression.value ? 330 : 0 )),
                Obx(() => _panelBlock(_expansion(logic, logic.state.expansion.value ? 210 : 0), logic.state.expansion.value ? 210 : 0 )),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _icon(IconData icon, void Function() onTap) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(32),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: 32,
          height: 46,
          margin: const EdgeInsets.symmetric(vertical: 8),
          color: Colors.transparent,
          alignment: Alignment.center,
          child: Icon(icon, color: const Color(0xff212121)),
        ),
      ),
    );
  }

  // 表情
  Widget _expression(ChatInputLogic logic, double height, BuildContext context) {
    return LimitedBox(
      maxHeight: height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 43,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 6, top: 6, left: 6, right: 6),
              child: TabBar(
                tabAlignment: TabAlignment.start,
                labelColor: Colors.black,
                labelStyle: const TextStyle(
                    color: Colors.red, fontSize: 16, fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.black54,
                unselectedLabelStyle: const TextStyle(color: Colors.black54),
                controller: logic.expressionTabController.value,
                onTap: (int index) {
                  // logic.state.tabIndex.value = index;
                },
                tabs: const [
                  Tab(
                    height: 30,
                    iconMargin: EdgeInsets.zero,
                    child: Icon(RemixIcon.user_smile_outline),
                  ),
                  Tab(
                    height: 30,
                    iconMargin: EdgeInsets.zero,
                    child: Icon(RemixIcon.magic_outline),
                  ),
                  Tab(
                    height: 30,
                    iconMargin: EdgeInsets.zero,
                    child: Icon(RemixIcon.heart_2_outline),
                  ),
                ],
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                padding: EdgeInsets.zero,
                indicatorWeight: 32,
                indicatorColor: Colors.white,
                indicator: const BoxDecoration(
                    borderRadius: BorderRadius.zero,
                    color: Colors.white
                ),
                labelPadding: const EdgeInsets.symmetric(
                    vertical:3,
                    horizontal: 6
                ),
                indicatorPadding: EdgeInsets.zero,
              ),
            ),
          ),
          Flexible(child: TabBarView(
            controller: logic.expressionTabController.value,
            children: [
              EmojiView(emojiList: logic.state.emojiList, isString: true, emojiCallback: (String emoji) {
                logic.setText(emoji);
              }, callback: (String tag) {
                if(tag == 'send') {
                  logic.emojiAction(clear: false, send: true);
                } else {
                  logic.emojiAction(clear: true, send: false);
                }
              }),
              EmojiView(emojiList: logic.state.smallRightList, emojiCallback: (String tag) {
                logic.emojiPictureAction(tag);
              }),
              const Text("1"),
            ],
          ))
        ],
      ),
    );
  }

  // 扩展
  Widget _expansion(ChatInputLogic logic, double height) {
    return GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 6,
            crossAxisSpacing: 6,
            childAspectRatio: 1.1),
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        primary: true,
        children: [
          _expansionItem(RemixIcon.image, "相册", () async {}),

          _expansionItem(RemixIcon.camera, "拍摄", () async {
            if(await Permission.camera.isGranted) {
              // if (context.mounted) {
              //   CameraPicker.pickFromCamera(context, pickerConfig: const CameraPickerConfig(
              //     enableRecording: true,
              //     maximumRecordingDuration: Duration(seconds: 60),
              //     minimumRecordingDuration: Duration(seconds: 3),
              //   )).then((AssetEntity? entity) {
              //     print("$entity");
              //   });
              // }
            } else if(await Permission.camera.isPermanentlyDenied)  {
               openAppSettings();
            } else {
               PermissionUtil.requestPermission([
                 Permission.camera
               ]);
            }
          }),
          _expansionItem(RemixIcon.phone, "语音通话", () async {}),
          _expansionItem(RemixIcon.share, "分享笔记", () async {}),
          _expansionItem(RemixIcon.map_pin, "位置分享", () async {}),
        ]);
  }

  Widget _expansionItem(IconData icon, String text, Future<void> Function() onTap) {
    return InkWell(
      onTap: () async {
        await onTap();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            margin: const EdgeInsets.only(bottom: 3),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(6)),
            child: Icon(
              icon,
              size: 22,
            ),
          ),
          Text(
            text,
            style: GoogleFonts.notoSans(
                fontSize: 12, color: const Color(0xff212121).withOpacity(0.9)),
          )
        ],
      ),
    );
  }

  Widget _panelBlock(Widget child, double height) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      height: height,
      color: Colors.transparent,
      child: child,
    );
  }
}
