import 'package:flutter/material.dart';


class ChatTip extends StatelessWidget {
  const ChatTip({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12
      ),
      child: const Column(
        children: [
          Text(
            "20:23",
            style: TextStyle(
                color: Color(0xffaaaaaa),
                fontSize: 12,
                height: 2
            ),
          ),
          Text(
            '"张三丰@腾讯科技"邀请你加入了群聊，群聊参与人还有：杨过、小龙女等',
            style: TextStyle(
                color: Color(0xffaaaaaa),
                fontSize: 13,
                height: 2
            ),
          ),
          Text(
            '"张三丰@腾讯科技"修改群名为“围攻光明顶群”',
            style: TextStyle(
                color: Color(0xffaaaaaa),
                fontSize: 12,
                height: 2
            ),
          )
        ],
      ),
    );
  }
}

