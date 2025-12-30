import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'live_logic.dart';

class LivePage extends StatelessWidget {
  final BuildContext parentContext;

  const LivePage({super.key, required this.parentContext});
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: LiveLogic(),
      assignId: true,
      builder: (LiveLogic logic) {
        return Container(
          padding: EdgeInsets.only(top: Get.mediaQuery.padding.top),
          child: Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              leading: InkWell(
                onTap: () {
                  Navigator.of(parentContext).pop();
                },
                child: const Icon(RemixIcon.close),
              ),
            ),
            body: Center(
              child: OutlinedButton(
                onPressed: () {},
                child: const Text("关闭"),
              ),
            ),
          ),
        );
      },
    );
  }
}
