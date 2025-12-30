import 'package:cappuccino/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:timeago/timeago.dart' as timeago;

class ChatUserItem extends StatelessWidget {
  final String? picture;
  final String name;
  final String text;
  final String id;
  final String dateTime;
  final Widget? widget;
  final void Function(String picture, String name)? tap;
  const ChatUserItem({super.key, this.picture, required this.name, required this.text, this.tap, required this.dateTime, this.widget, required this.id});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(id),
      endActionPane: ActionPane(
        motion: const DrawerMotion(),
        extentRatio: 0.4,
        children: [
          SlidableAction(
            padding: EdgeInsets.zero,
            spacing: 0,
            onPressed: (BuildContext context) {},
            backgroundColor: const Color(0xFFEf905b),
            foregroundColor: Colors.white,
            label: "置顶聊天",
          ),
          SlidableAction(
            padding: EdgeInsets.zero,
            spacing: 0,
            onPressed: (BuildContext context) {},
            backgroundColor: const Color(0xFFFF453A),
            foregroundColor: Colors.white,
            label: "删除",
          ),
        ],
      ),
      child: InkWell(
        onTap: () {
          if(tap != null) {
            tap!(picture ?? '', name ?? '');
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 13
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(46),
                child: widget ?? (picture != null ? Utils.cachePicture(picture!, width: 46, height: 46) : const SizedBox.shrink()),
              ),
              Expanded(child: Padding(
                padding: const EdgeInsets.only(
                    left: 12
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(name, style: TextStyle(
                            fontSize: 16,
                            color: Colors.black.withOpacity(0.8)
                        )),
                        Text(timeago.format(DateTime.parse(dateTime), locale: 'zh_cn', allowFromNow: true) ?? '', style: TextStyle(
                            fontSize: 14,
                            color: Colors.black.withOpacity(0.4)
                        )),
                      ],
                    ),
                    Padding(padding: const EdgeInsets.only(top: 6),child: Text(
                      text,
                      style: TextStyle(
                          fontSize: 14.6,
                          color: Colors.black.withOpacity(0.4)
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),)
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

