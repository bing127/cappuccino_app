import 'package:cappuccino/constants/colors.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'app_image/app_image.dart';

enum PictureType {
  local,
  network,
}

enum CardType {
  text,
  video,
}

class CardItemJumpParams {
  final String? id;
  final String username;
  final String avatar;
  final String picture;
  final String? text;
  final int? like;
  final CardType? cardType;

  CardItemJumpParams({this.id, required this.username, required this.avatar, required this.picture, this.text, this.like, this.cardType});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = username;
    data['avatar'] = avatar;
    data['picture'] = picture;
    return data;
  }

}

typedef callback = void Function(CardItemJumpParams params);

class CardItem extends StatelessWidget {
  final String picture;
  final String text;
  final String avatar;
  final PictureType? pictureType;
  final CardType? cardType;
  final String username;
  final int like;
  final callback? tap;

  const CardItem(
      {super.key,
      required this.picture,
      required this.text,
      required this.avatar,
      required this.like,
      required this.username,
      this.tap,
      this.pictureType = PictureType.network,
      this.cardType = CardType.text});

  @override
  Widget build(BuildContext context) {
    String keyId = Utils.uuid();
    final Widget image = SizedBox(
      child: pictureType == PictureType.local ? Image.asset(picture) : AppImage(
        image: NetworkImage(picture),
        fit: BoxFit.cover,
        progress: true,
        color: BasicColor.mainColor.withOpacity(0.3),
      ),
    );

    return Hero(
      tag: keyId,
      child: Material(
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
        child: InkWell(
          onTap: () {
            if (tap != null) {
              tap!(CardItemJumpParams(id: keyId, username: username, avatar: avatar, picture: picture));
            }
          },
          child: Stack(
            fit: StackFit.loose,
            children: [
              Container(
                width: double.infinity,
                constraints: const BoxConstraints(
                    minHeight: 220
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: image,
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          left: 6,
                          right: 6,
                          bottom: 6
                      ),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(4),
                            bottomRight:  Radius.circular(4),
                          )
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Text(
                                text,
                                style: GoogleFonts.roboto(),
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                overflow: TextOverflow.ellipsis,
                              )),
                          Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: SizedBox(
                                              width: 20,
                                              child: Utils.cachePicture(avatar,
                                                  width: 20, height: 20)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 6),
                                          child: Text(
                                            "十一小困包",
                                            style: TextStyle(
                                                fontSize: 13,
                                                color: Colors.black.withOpacity(0.8)),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        RemixIcon.heart_2_outline,
                                        color: Colors.black.withOpacity(0.6),
                                        size: 16,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 2),
                                        child: Text(
                                          '$like',
                                          style: GoogleFonts.roboto(
                                              color: Colors.black.withOpacity(0.6)),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ),
              cardType == CardType.video
                  ? Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 18,
                  height: 18,
                  decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(50)),
                  child: const Icon(
                    RemixIcon.play,
                    color: Colors.white,
                    size: 12,
                  ),
                ),
              )
                  : const SizedBox.shrink()
            ],
          ),
        ),
      ),
    );
  }
}
