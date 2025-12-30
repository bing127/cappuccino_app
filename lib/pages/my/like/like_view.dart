import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'like_logic.dart';

class LikePage extends StatelessWidget {
  const LikePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LikeLogic(),
      assignId: true,
      builder: (LikeLogic logic) {
        return Container(
          alignment: Alignment.center,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/wlJ.webp", width: 80,),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20
                  ),
                  child: Text(
                    "还没有赞任何笔记哦",
                    style: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                        fontSize: 14
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
