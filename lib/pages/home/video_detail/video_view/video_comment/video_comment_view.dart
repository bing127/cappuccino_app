import 'package:cappuccino/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'video_comment_logic.dart';

class VideoCommentPage extends StatelessWidget {
  final void Function() back;
  const VideoCommentPage({super.key, required this.back});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      assignId: true,
      initState: (GetBuilderState<VideoCommentLogic>? state) {},
      init: VideoCommentLogic(),
      builder: (VideoCommentLogic controller) {
        return Container(
          height: Get.height / 1.43,
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10)
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _commentHeader(),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10
                  ),
                  shrinkWrap: true,
                  children: [
                    _commentItem(),
                    _commentItem(),
                    _commentItem(),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _commentHeader() {
    return Container(
      decoration: BoxDecoration(
         border: Border(
           bottom: BorderSide(
             color: const Color(0xff333333).withOpacity(0.15),
             width: 0.5
           )
         )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            width: 46,
          ),
          Text(
            "共1232条评论",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold
            ),
          ),
          TextButton(onPressed: () {
            back();
          }, child: const Icon(RemixIcon.close_outline, color: Colors.black,))
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
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Column(
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
                                    style: TextStyle(
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
                  )),
                  TextButton(onPressed: (){}, child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        RemixIcon.heart_2_outline,
                        size: 20,
                        color: const Color(0xff333333).withOpacity(0.6),
                      ),
                      Text(
                        "232",
                        style: TextStyle(
                          color: const Color(0xff333333).withOpacity(0.6),
                        ),
                      )
                    ],
                  ))
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
                  Row(
                    children: [
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
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
                                        style: TextStyle(
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
                      )),
                      TextButton(onPressed: (){}, child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            RemixIcon.heart_2_outline,
                            size: 20,
                            color: const Color(0xff333333).withOpacity(0.6),
                          ),
                          Text(
                            "232",
                            style: TextStyle(
                              color: const Color(0xff333333).withOpacity(0.6),
                            ),
                          )
                        ],
                      ))
                    ],
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
