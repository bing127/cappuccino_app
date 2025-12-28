import 'package:cappuccino/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_image/app_image.dart';

typedef Callback = void Function(String picture, String text);
class ShopItem extends StatelessWidget {
  final String picture;
  final String text;
  final double price;
  final String salesVolume;
  final String? describe;
  final Callback? onTap;

  const ShopItem(
      {super.key,
        required this.picture,
        required this.price,
        required this.text,
        required this.salesVolume,
        this.onTap,
        this.describe});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(4),
      child: InkWell(
        onTap: () {
          onTap!(picture, text);
        },
        child: Container(
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
                  child: AppImage(
                    image: NetworkImage(picture),
                    fit: BoxFit.cover,
                    progress: true,
                    color: BasicColor.mainColor.withOpacity(0.3),
                  )
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 4,
                      left: 4,right: 4),
                  child: Text(
                    text,
                    style: GoogleFonts.roboto(),
                    maxLines: 2,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                  )),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6,
                      horizontal: 10
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "¥",
                            style: GoogleFonts.oswald(
                              fontSize: 13,
                              height: 1,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          ),
                          Text(
                            "$price",
                            style: GoogleFonts.oswald(
                              fontSize: 18,
                              height: 1,
                              color: Colors.black.withOpacity(0.8),
                            ),
                          )
                        ],
                      ),
                      Text(
                        salesVolume,
                        style: GoogleFonts.roboto(
                            fontSize: 13,
                            color: Colors.black.withOpacity(0.3)),
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

