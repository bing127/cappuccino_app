import 'package:flutter/material.dart';
import 'package:get/get.dart';


import 'collect_logic.dart';

class CollectPage extends StatelessWidget {
  const CollectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CollectLogic(),
      assignId: true,
      builder: (CollectLogic logic) {
        return Container(
          alignment: Alignment.center,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset("assets/images/qDZ.png", width: 80,),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 20
                  ),
                  child: Text(
                    "还没有收藏任何笔记哦",
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
