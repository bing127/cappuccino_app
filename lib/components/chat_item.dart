import 'package:cappuccino/components/app_image/app_image.dart';
import 'package:cappuccino/components/chat_model.dart';
import 'package:cappuccino/constants/colors.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class ChatItem extends StatelessWidget {
  final ChatUser target;
  final ChatType? type;
  final String text;
  final String? avatar;
  final String? user;

  const ChatItem(
      {super.key,
      required this.target,
      this.type = ChatType.text,
      required this.text,
      required this.avatar,
      required this.user});

  @override
  Widget build(BuildContext context) {
    late List<Widget> widget = [];

    if (target == ChatUser.sender) {
      widget = [
        _chatWrapper(),
        ClipRRect(
            borderRadius: BorderRadius.circular(36),
            child: SizedBox(
              width: 36,
              height: 36,
              child: AppImage(
                image: NetworkImage(avatar!),
                fit: BoxFit.cover,
                progress: true,
                color: BasicColor.mainColor.withOpacity(0.3),
              ),
            ))
      ];
    } else {
      widget = [
        Padding(
          padding: const EdgeInsets.only(top: 12),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(36),
            child: SizedBox(
                width: 36,
                child: Utils.cachePicture(avatar!, width: 36, height: 36)),
          ),
        ),
        _chatWrapper(),
      ];
    }

    return Container(
      width: double.infinity,
      alignment: target == ChatUser.sender
          ? Alignment.centerRight
          : Alignment.centerLeft,
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: constraints.maxWidth * 0.78,
                minWidth: constraints.maxWidth * 0.3),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: target == ChatUser.sender
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _chatWrapper() {
    Widget innerWrapper = RichText(
      textAlign: target == ChatUser.sender ? TextAlign.right : TextAlign.left,
      text: TextSpan(
        children: [
          WidgetSpan(
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  margin: EdgeInsets.only(
                      left: target != ChatUser.sender ? 8 : 0,
                      right: target == ChatUser.sender ? 8 : 0),
                  decoration: BoxDecoration(
                      color: target == ChatUser.sender
                          ? BasicColor.mainColor
                          : Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  child: type == ChatType.text ? RichText(
                    text: TextSpan(
                        children: _parseText(text, target == ChatUser.sender)),
                  ) : Image.asset(text, width: 100,),
                ),
                Positioned(
                  top: 10,
                  right: target == ChatUser.sender ? 2 : null,
                  left: target != ChatUser.sender ? 2 : null,
                  child: CustomPaint(
                    size: const Size(6, 10),
                    painter: TrianglePainter(
                      color: target == ChatUser.sender
                          ? BasicColor.mainColor
                          : Colors.white,
                      isLeft: target != ChatUser.sender,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
    return target != ChatUser.sender
        ? Expanded(
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 2),
                child: Text(user!,
                    style: TextStyle(
                        color: Colors.grey.withOpacity(0.6), fontSize: 13)),
              ),
              innerWrapper
            ],
          ))
        : Expanded(
            child: innerWrapper,
          );
  }

  List<TextSpan> _parseText(String text, bool isSender) {
    if (text.isEmpty) {
      return [const TextSpan(text: '')];
    } else {
      List<String> strList = text.characters.toList();
      var parser = EmojiParser();
      return strList.map((e) {
        if (parser.hasEmoji(e)) {
          return TextSpan(
              text: e,
              style: TextStyle(
                  fontSize: 20,
                  height: 1.6,
                  color: isSender ? Colors.white : const Color(0xff212121)));
        } else {
          return TextSpan(
              text: e,
              style: TextStyle(
                  fontSize: 16,
                  height: 1.6,
                  color: isSender ? Colors.white : const Color(0xff212121)));
        }
      }).toList();
    }
  }
}

class TrianglePainter extends CustomPainter {
  final Color color;
  final bool isLeft; // 控制三角形方向

  TrianglePainter({required this.color, required this.isLeft});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    if (isLeft) {
      path
        ..moveTo(size.width, 0)
        ..lineTo(0, size.height / 2)
        ..lineTo(size.width, size.height)
        ..close();
    } else {
      path
        ..moveTo(0, 0)
        ..lineTo(0, size.height)
        ..lineTo(size.width, size.height / 2)
        ..close();
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
