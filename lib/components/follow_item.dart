import 'package:cappuccino/components/app_image/app_image.dart';
import 'package:cappuccino/components/card_item.dart';
import 'package:cappuccino/constants/colors.dart';
import 'package:cappuccino/routes/app_routes.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'base_simple_video.dart';

class FollowItem extends StatelessWidget {
  final String? id;
  final String username;
  final String avatar;
  final String picture;
  final String? path;
  final String dateTime;
  final int like;
  final int collect;
  final int comment;
  final String? text;
  final CardType? cardType;

  const FollowItem(
      {super.key,
      this.id,
      required this.username,
      required this.avatar,
      required this.picture,
      this.text,
      this.cardType,
      required this.dateTime,
      required this.collect,
      required this.comment,
      required this.like,
      this.path});

  @override
  Widget build(BuildContext context) {
    String keyId = Utils.uuid();
    return Hero(
        tag: keyId,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 10),
          constraints: BoxConstraints(maxHeight: Get.height * 0.7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: SizedBox(
                            width: 28,
                            height: 28,
                            child: AppImage(
                              image: NetworkImage(avatar),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            username,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                        Container(
                          width: 3,
                          height: 3,
                          margin: const EdgeInsets.symmetric(
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(3)),
                        ),
                        Text(
                          timeago.format(DateTime.parse(dateTime),
                              locale: 'zh_cn', allowFromNow: true),
                          style:
                              const TextStyle(fontSize: 12, color: Colors.grey),
                        )
                      ],
                    ),
                    IconButton(
                        padding: EdgeInsets.zero,
                        style: const ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(30, 30)),
                          maximumSize: MaterialStatePropertyAll(Size(30, 30)),
                          minimumSize: MaterialStatePropertyAll(Size(30, 30)),
                        ),
                        onPressed: () {},
                        icon: const Icon(RemixIcon.more_outline))
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.zero,
                  width: double.infinity,
                  child: cardType == CardType.video
                      ? BaseSimpleVideo(
                          path: path!,
                          poster: picture,
                        )
                      : Swiper(
                          autoplay: true,
                          itemCount: 3,
                          autoplayDelay: 8000,
                          outer: true,
                          pagination: SwiperPagination(
                              builder: DotSwiperPaginationBuilder(
                            color: Colors.grey.withOpacity(0.3),
                          )),
                          itemBuilder: (context, index) {
                            return AppImage(
                              image: NetworkImage(picture),
                              fit: BoxFit.cover,
                              progress: true,
                              color: BasicColor.mainColor.withOpacity(0.3),
                            );
                          },
                        ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {},
                        style: const ButtonStyle(
                            padding: MaterialStatePropertyAll(EdgeInsets.zero)),
                        icon: const Icon(
                          RemixIcon.share_box_outline,
                          color: Colors.black,
                        )),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          InkWell(
                            child: Row(
                              children: [
                                const Icon(
                                  RemixIcon.heart_outline,
                                  color: Colors.black,
                                ),
                                Text(
                                  "$like",
                                  style: const TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                            onTap: () {},
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          InkWell(
                            child: Row(
                              children: [
                                const Icon(
                                  RemixIcon.star_outline,
                                  color: Colors.black,
                                ),
                                Text(
                                  "$collect",
                                  style: const TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                            onTap: () {},
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          InkWell(
                            child: Row(
                              children: [
                                const Icon(
                                  RemixIcon.chat_smile_2_outline,
                                  color: Colors.black,
                                ),
                                Text(
                                  '$comment',
                                  style: const TextStyle(fontSize: 16),
                                )
                              ],
                            ),
                            onTap: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: LayoutBuilder(
                  builder: (_, constraints) {
                    final textPainter = TextPainter(
                      text: TextSpan(text: text),
                      maxLines: 1,
                      textDirection: TextDirection.ltr,
                    )..layout(maxWidth: constraints.maxWidth);
                    return RichText(
                      maxLines: 1,
                      text: TextSpan(
                          text: '',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          children: [
                            WidgetSpan(
                                child: SizedBox(
                                  width: textPainter.width - 60,
                                  child: Text("$text",
                                      overflow: TextOverflow.ellipsis),
                                )),WidgetSpan(
                                child: InkWell(
                                  child: Text(
                                    "查看全文",
                                    style:
                                    TextStyle(color: BasicColor.mainColor),
                                  ),
                                  onTap: () {
                                    Get.toNamed('${Routes.home}${cardType == CardType.video ? Routes.homeVideo : Routes.homeArticle}',
                                        arguments:CardItemJumpParams(
                                          id: id,
                                          username: username, avatar: avatar, picture: picture,
                                        ).toJson());
                                  },
                                ))
                          ]),
                    );
                  },
                ),
              )
            ],
          ),
        ));
  }
}
