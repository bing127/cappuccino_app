import 'package:cappuccino/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';

class EmojiView extends StatelessWidget {
  final List<String> emojiList;
  final bool? isString;
  final void Function(String emoji)? emojiCallback;
  final void Function(String tag)? callback;
  const EmojiView({super.key, required this.emojiList, this.isString = false, this.emojiCallback, this.callback});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GridView.builder(
            itemCount: emojiList.length,
            padding: const EdgeInsets.only(
                bottom: 40
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8,
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  emojiCallback!(emojiList[index]);
                },
                child: isString == true ? Center(
                  child: Text(emojiList[index], style: const TextStyle(
                      fontSize: 28
                  ),),
                ) : Image(image: AssetImage(emojiList[index]), width: 25, height: 25, fit: BoxFit.fitHeight,),
              );
            }
        ),
        Positioned(
          bottom: 10,
          right: 12,
          child: Container(
            height: 40,
            color: Colors.transparent,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                FilledButton(onPressed: () {
                  callback!('clear');
                },
                  style: const ButtonStyle(
                      padding: MaterialStatePropertyAll(EdgeInsets.zero),
                      fixedSize: MaterialStatePropertyAll(Size(60, 32)),
                      minimumSize: MaterialStatePropertyAll(Size(60, 32)),
                      maximumSize: MaterialStatePropertyAll(Size(60, 32)),
                      backgroundColor: MaterialStatePropertyAll(Color(
                          0xFFB6B6B9))
                  ),
                  child: const Icon(RemixIcon.close),
                ),
                const SizedBox(width: 12,),
                FilledButton(onPressed: () {
                  callback!('send');
                },
                  style: ButtonStyle(
                      padding: const MaterialStatePropertyAll(EdgeInsets.zero),
                      fixedSize: const MaterialStatePropertyAll(Size(60, 32)),
                      minimumSize: const MaterialStatePropertyAll(Size(60, 32)),
                      maximumSize: const MaterialStatePropertyAll(Size(60, 32)),
                      backgroundColor: MaterialStatePropertyAll(BasicColor.mainColor)
                  ),
                  child: const Text("发送"),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
