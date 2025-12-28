import 'package:cappuccino/components/bottom_comment_group/bottom_comment_group_view.dart';
import 'package:cappuccino/constants/colors.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';

class ArticleDetailPage extends StatelessWidget {
  const ArticleDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Hero(
        tag: Get.arguments != null && Get.arguments['id'] != null ? Get.arguments : '',
        child: SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                titleSpacing: 0,
                leading: const SizedBox.shrink(),
                flexibleSpace: FlexibleSpaceBar(
                  titlePadding: EdgeInsets.zero,
                  title: Container(
                    margin: EdgeInsets.only(
                        top: Get.mediaQuery.padding.top, right: 12),
                    height: AppBar().preferredSize.height,
                    child: Flex(
                      direction: Axis.horizontal,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: Icon(RemixIcon.arrow_left_s_outline,
                              color: Colors.black.withOpacity(0.6)),
                          onPressed: () {
                            Get.back();
                          },
                        ),
                        Flex(
                          direction: Axis.horizontal,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 23,
                              height: 23,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(23),
                                child: Get.arguments!= null && Get.arguments['avatar'] != null ? Utils.cachePicture(
                                    Get.arguments['avatar'],
                                    width: 23,
                                    height: 23) : const SizedBox.shrink(),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 6),
                              child: Text(
                                "${Get.arguments!= null && Get.arguments['name'] != null ? Get.arguments['name'] : ''}",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.8),
                                    fontSize: 14),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                actions: [
                  Container(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 8),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: BasicColor.mainColor.withOpacity(0.1),
                          border: Border.all(
                              color: BasicColor.mainColor.withOpacity(0.3)),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          '关注',
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: BasicColor.mainColor.withOpacity(0.6),
                              fontSize: 14),
                        ),
                      ),
                      onTap: () {},
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 6),
                      child: Icon(
                        RemixIcon.share_box_outline,
                        color: Colors.black.withOpacity(0.8),
                        size: 18,
                      ),
                    ),
                  )
                ],
              ),
              body: ListView(
                children: [
                  _picture(),
                  _content(),
                  _comment(),
                ],
              ),
              resizeToAvoidBottomInset: false,
              bottomNavigationBar: const BottomCommentGroupPage(),
          ),
        ));
  }

  Widget _picture() {
    return Container(
      height: Get.height / 1.8,
      width: double.infinity,
      child: Swiper(
        autoplay: true,
        itemCount: 3,
        autoplayDelay: 6000,
        pagination: const SwiperPagination(
            alignment: Alignment.bottomRight,
            builder:
                FractionPaginationBuilder(activeFontSize: 16, fontSize: 16)),
        itemBuilder: (context, index) {
          if (Get.arguments != null && Get.arguments['picture'] != null) {
            return Utils.cachePicture(Get.arguments['picture']);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget _content() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      decoration: BoxDecoration(
         border: Border(
           bottom: BorderSide(
             color: Colors.black.withOpacity(0.1),
             width: 0.5
           )
         )
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "我当初怎么会喜欢你呢 你总是那么刻薄犀利？",
              style: TextStyle(fontSize: 18),
            ),
          ),
          RichText(
            text: const TextSpan(
                text: "“你把我逼疯，再静静地看着我发疯，最后还要站在道德的制高点上埋怨我情绪不稳定。",
                style:
                    TextStyle(fontSize: 16, color: Colors.black, height: 1.6),
                children: [
                  TextSpan(text: "你看，哪怕是事实，哪怕女的没有歇斯底里男的也觉得她无理取闹。"),
                ]),
          ),
          RichText(
            text: const TextSpan(
                text: "观光车上岳麓山咯！（懒人两只哈哈",
                style:
                    TextStyle(fontSize: 16, color: Colors.black, height: 1.6),
                children: [
                  TextSpan(text: "⛰️上风景太美啦 好治愈～路过一家悬崖边的咖啡店📸️就去玩滑道啦耶耶 过瘾！！！"),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: RichText(
              text: const TextSpan(
                  text: "#岳麓山",
                  style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff13386c),
                      fontWeight: FontWeight.w600,
                      height: 1.6),
                  children: [
                    WidgetSpan(
                        child: SizedBox(
                      width: 6,
                    )),
                    TextSpan(text: "#来拍照了"),
                    WidgetSpan(
                        child: SizedBox(
                      width: 6,
                    )),
                    TextSpan(text: "#女大学生"),
                    WidgetSpan(
                        child: SizedBox(
                      width: 6,
                    )),
                    TextSpan(text: "#大学生情侣"),
                    WidgetSpan(
                        child: SizedBox(
                      width: 6,
                    )),
                    TextSpan(text: "#长沙旅游"),
                    WidgetSpan(
                        child: SizedBox(
                      width: 6,
                    )),
                    TextSpan(text: "#长沙打卡"),
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "10-23   山西",
              style: TextStyle(
                fontSize: 13,
                color: Colors.black.withOpacity(0.6)
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _comment() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 12
              ),
              child: Text(
                "共1326条评论",
                style: TextStyle(
                  fontSize: 16,
                  letterSpacing: 2,
                  color: Colors.black.withOpacity(0.6)
                ),
              ),
            ),
          _commentItem(),
          _commentItem(),
          _commentItem(),
        ],
      ),
    );
  }

  Widget _commentItem() {
     Widget contentText = Container(
       padding: const EdgeInsets.only(
           top: 12
       ),
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           ClipRRect(
             borderRadius: BorderRadius.circular(26),
             child: Utils.cachePicture(
                 "https://sns-img-qc.xhscdn.com/86a87995-f041-a158-d44d-2e7947e154ac",
                 width: 26,
                 height: 26),
           ),
           Expanded(
             child: Padding(
               padding: const EdgeInsets.only(
                   left: 10
               ),
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     "轻舟",
                     style: TextStyle(
                         color: const Color(0xff333333).withOpacity(0.4),
                         fontSize: 14.6
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(
                         top: 3
                     ),
                     child: RichText(
                       text: TextSpan(
                           children: [
                             TextSpan(
                                 text: "上天是公平的，她得到了容貌和身材，却失去了我，就像鱼失去了自行车。",
                                 style: TextStyle(
                                   color: const Color(0xff333333).withOpacity(0.6),
                                 )
                             ),
                             TextSpan(
                                 text: "10-23",
                                 style: GoogleFonts.roboto(
                                   fontWeight: FontWeight.w500,
                                   color: const Color(0xff333333).withOpacity(0.4),
                                 )
                             ),
                             const WidgetSpan(child: SizedBox(width: 6,)),
                             TextSpan(
                                 text: "上海",
                                 style:TextStyle(
                                   color: const Color(0xff333333).withOpacity(0.4),
                                 )
                             ),
                             const WidgetSpan(child: SizedBox(width: 6,)),
                             TextSpan(
                                 text: "回复",
                                 style:TextStyle(
                                   color: const Color(0xff333333).withOpacity(0.8),
                                 )
                             ),
                           ]
                       ),
                     ),
                   ),
                 ],
               ),
             ),
           )
         ],
       ),
     );
     return Container(
       padding: const EdgeInsets.only(
         bottom: 12
       ),
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           ClipRRect(
             borderRadius: BorderRadius.circular(36),
             child: Utils.cachePicture(
                 "https://sns-img-qc.xhscdn.com/86a87995-f041-a158-d44d-2e7947e154ac",
                 width: 36,
                 height: 36),
           ),
           Expanded(
             child: Container(
               padding: const EdgeInsets.only(
                 left: 10,
                 bottom: 10
               ),
               decoration: BoxDecoration(
                   border: Border(
                       bottom: BorderSide(
                           color: Colors.black.withOpacity(0.1),
                           width: 0.5
                       )
                   )
               ),
               child: Column(
                 mainAxisSize: MainAxisSize.min,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(
                     "轻舟",
                     style: TextStyle(
                       color: const Color(0xff333333).withOpacity(0.4),
                       fontSize: 14.6
                     ),
                   ),
                   Padding(
                     padding: const EdgeInsets.only(
                       top: 3
                     ),
                     child: RichText(
                       text: TextSpan(
                         children: [
                           TextSpan(
                               text: "上天是公平的，她得到了容貌和身材，却失去了我，就像鱼失去了自行车。",
                               style: TextStyle(
                                 color: const Color(0xff333333).withOpacity(0.6),
                               )
                           ),
                           TextSpan(
                               text: "10-23",
                               style: GoogleFonts.roboto(
                                 fontWeight: FontWeight.w500,
                                 color: const Color(0xff333333).withOpacity(0.4),
                               )
                           ),
                           const WidgetSpan(child: SizedBox(width: 6,)),
                           TextSpan(
                               text: "上海",
                               style:TextStyle(
                                 color: const Color(0xff333333).withOpacity(0.4),
                               )
                           ),
                           const WidgetSpan(child: SizedBox(width: 6,)),
                           TextSpan(
                               text: "回复",
                               style:TextStyle(
                                 color: const Color(0xff333333).withOpacity(0.8),
                               )
                           ),
                         ]
                       ),
                     ),
                   ),
                   contentText,
                   contentText,
                   contentText,
                 ],
               ),
             ),
           )
         ],
       ),
     );
  }
}
