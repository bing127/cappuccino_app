import 'package:cappuccino/components/cache_widget.dart';
import 'package:cappuccino/components/chat_user_item.dart';
import 'package:cappuccino/routes/app_routes.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'message_logic.dart';

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final state = Get.find<MessageLogic>().state;

    return SlidableAutoCloseBehavior(
      child: CacheWidget(
        child: SafeArea(
          top: false,
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              elevation: 0,
              leading: const SizedBox.shrink(),
              backgroundColor: Colors.white,
              automaticallyImplyLeading: true,
              centerTitle: true,
              actions: [
                InkWell(
                  onTap: () {
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              right: 3
                          ),
                          child: Icon(RemixIcon.group_outline, size: 14, color: Colors.black.withOpacity(0.6),),
                        ),
                        Text(
                          "创建群聊",
                          style: TextStyle(
                            color: Colors.black.withOpacity(0.6),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
              title: const Text(
                "消息",
                style: TextStyle(color: Color(0xff252525), fontSize: 16, fontWeight: FontWeight.w600),
              ),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(78),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _toolItem(
                          "assets/images/Xlv.png",
                          "赞和收藏"
                      ),
                      _toolItem(
                          "assets/images/A_h.png",
                          "新增关注"
                      ),
                      _toolItem(
                          "assets/images/TY2.png",
                          "评论和@"
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.only(
                  top: 16
              ),
              children: [
                ChatUserItem(id: Utils.uuid(),name: "消息通知", text: "隐私政策更新通知", dateTime: '2023-11-14 21:31:06', tap: (String picture, String name) {
                  // Get.toNamed('${Routes.message}${Routes.messageDetail}', arguments: {
                  //   'name': name,
                  //   'avatar': picture,
                  // });
                }, widget: Container(
                  width: 46,
                  height: 46,
                  decoration: const BoxDecoration(
                      color: Color(0xff6192f7)
                  ),
                  child: const Icon(RemixIcon.message, color: Colors.white,),
                )),
                ChatUserItem(id: Utils.uuid(), name: "客服聊天", text: "晓雪的店：「商家为您推荐」", dateTime: '2023-11-14 22:31:06', tap: (String picture, String name) {
                  // Get.toNamed('${Routes.message}${Routes.messageDetail}', arguments: {
                  //   'name': name,
                  //   'avatar': picture,
                  // });
                }, widget: Container(
                  width: 46,
                  height: 46,
                  decoration: const BoxDecoration(
                      color: Color(0xfff09b5c)
                  ),
                  child: const Icon(RemixIcon.customer_service_outline, color: Colors.white,),
                )),
                ...state.chartData.asMap().values.map((e) {
                  return ChatUserItem(id: e.id, name: e.name, picture: e.picture, text: e.text, dateTime: e.dateTime, tap: (String picture, String name) {
                    Get.toNamed('${Routes.message}${Routes.messageDetail}', arguments: {
                      'name': name,
                      'avatar': picture,
                    });
                  });
                })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _toolItem(String picture, String text) {
    return InkWell(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(picture, width: 50, height: 50,),
            Padding(
              padding: const EdgeInsets.only(
                top: 6
              ),
              child: Text(
                text,
                style: GoogleFonts.notoSans(
                    fontWeight: FontWeight.w100,
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 14
                ),
              ),
            )
          ],
      ),
    );
  }
}
