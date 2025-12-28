import 'package:cappuccino/pages/release——/album/album_view.dart';
import 'package:cappuccino/pages/release——/capture/capture_view.dart';
import 'package:cappuccino/pages/release——/live/live_view.dart';
import 'package:cappuccino/pages/release——/now/now_view.dart';
import 'package:cappuccino/pages/release——/template/template_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'release_logic.dart';

class ReleasePage extends StatelessWidget {
  final BuildContext parentContext;

  const ReleasePage({super.key, required this.parentContext});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: ReleaseLogic(),
      assignId: true,
      builder: (ReleaseLogic logic) {
        return Material(
          color: Colors.black,
          child: SafeArea(
             top: false,
              child: Scaffold(
                backgroundColor: Colors.black,
                body: PageView(
                  controller: logic.state.pageController.value,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    CapturePage(parentContext: parentContext),
                    NowPage(parentContext: parentContext),
                    AlbumPage(parentContext: parentContext),
                    TemplatePage(parentContext: parentContext),
                    LivePage(parentContext: parentContext),
                  ],
                ),
                bottomNavigationBar: Obx(() => BottomNavigationBar(
                  backgroundColor: Colors.black,
                  elevation: 0,
                  currentIndex: logic.state.currentIndex.value,
                  iconSize: 0,
                  type: BottomNavigationBarType.fixed,
                  onTap: logic.setPageIndex,
                  unselectedFontSize: 0,
                  selectedFontSize: 0,
                  items: ['拍摄', '此刻', '相册', '模板', '直播'].asMap().entries.map<BottomNavigationBarItem>((entry) {
                    return  BottomNavigationBarItem(label: "", icon: Container(
                      decoration:  BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                color: logic.state.currentIndex.value != entry.key ? Colors.transparent : Colors.white,
                                width: 2,
                              )
                          )
                      ),
                      padding: const EdgeInsets.only(
                          bottom: 4
                      ),
                      child:  Text(entry.value, style: TextStyle(
                          color: logic.state.currentIndex.value != entry.key?  Colors.white.withOpacity(0.6) :  Colors.white
                      )),
                    ));
                  }).toList(),
                )),
              )),
        );
      },
    );
  }
}
