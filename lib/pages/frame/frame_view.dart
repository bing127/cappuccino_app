import 'package:cappuccino/components/inner_drawer.dart';
import 'package:cappuccino/pages/frame/frame_state.dart';
import 'package:cappuccino/pages/home/send/send_view.dart';
import 'package:cappuccino/pages/message/message_view.dart';
import 'package:cappuccino/pages/my/more/more_view.dart';
import 'package:cappuccino/pages/release/release_view.dart';
import 'package:cappuccino/pages/shop/shop_view.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:cappuccino/constants/colors.dart';
import 'package:cappuccino/pages/home/home_view.dart';
import 'package:cappuccino/pages/my/my_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

import 'frame_logic.dart';

class FramePage extends StatelessWidget {
  const FramePage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<FrameLogic>();
    final state = Get.find<FrameLogic>().state;
    return Obx(() => InnerDrawer(
      boxShadow: const [
        BoxShadow(
          color: Colors.transparent,
        )
      ],
      open: state.drawerType.value != DrawerType.none,
      innerDrawerCallback: (bool isOpen) {
        if(!isOpen) {
          SystemChrome.setSystemUIOverlayStyle(Utils.dark);
        } else {
          if(state.drawerType.value == DrawerType.home) {
            SystemChrome.setSystemUIOverlayStyle(Utils.light);
          }
        }
        if(!isOpen) {
           state.drawerType.value = DrawerType.none;
        }
      },
      onTapClose: true,
      offset: state.drawerType.value == DrawerType.home ? const IDOffset.horizontal(1) : const IDOffset.horizontal(0.32),
      swipe: state.currentIndex.value == 4,
      leftChild: Material(
        color: Colors.white,
        child: state.drawerType.value == DrawerType.home ? SendPage(callback: () {
          state.drawerType.value = DrawerType.none;
        },) : MorePage(callback: () {
          state.drawerType.value = DrawerType.none;
        }),
      ),
      scaffold: Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: state.pageController.value,
          children: const [
            HomePage(),
            ShopPage(),
            SizedBox.shrink(),
            MessagePage(),
            MyPage()
          ],
        ),
        bottomNavigationBar: Obx(() => BottomNavigationBar(
          elevation: 0,
          currentIndex: state.currentIndex.value,
          backgroundColor: Colors.white,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) async {
            if(index == 2) {
              if (await Permission.photos.request().isDenied && await Permission.camera.request().isDenied) {
                await [
                  Permission.photos,
                  Permission.camera,
                ].request();
                return;
              } else {
                if (context.mounted) {
                  _release(context);
                }
              }
            } else {
              logic.setPageIndex(index);
            }
          },
          items: state.tabList
              .asMap()
              .keys
              .map<BottomNavigationBarItem>((index) {
            if (index == 2) {
              return BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                          color: BasicColor.mainColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(state.tabList[index].icon,
                          color: Colors.white),
                    ),
                  ),
                  label: '');
            } else {
              return BottomNavigationBarItem(
                  icon: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      index == 3 ? badges.Badge(
                        position: badges.BadgePosition.topEnd(top: -10, end: -10),
                        showBadge: true,
                        badgeContent: Text(
                          '3',
                          style: GoogleFonts.roboto(color: Colors.white),
                        ),
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: BasicColor.mainColor,
                        ),
                        child: Icon(
                          state.currentIndex.value == index
                              ? state.tabList[index].activeIcon
                              : state.tabList[index].icon,
                          size: 20,
                          color: state.currentIndex.value == index
                              ? BasicColor.mainColor
                              : const Color(0xff6B6B6C),
                        ),
                      ) : Icon(
                        state.currentIndex.value == index
                            ? state.tabList[index].activeIcon
                            : state.tabList[index].icon,
                        size: 20,
                        color: state.currentIndex.value == index
                            ? BasicColor.mainColor
                            : const Color(0xff6B6B6C),
                      ),
                      Text(
                        state.tabList[index].text,
                        style: TextStyle(
                            fontSize: 11,
                            color: state.currentIndex.value == index
                                ? BasicColor.mainColor
                                : const Color(0xff6B6B6C)),
                      )
                    ],
                  ),
                  label: '');
            }
          }).toList(),
        )),
      ),
    ));
  }

  void _release(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: false,
        builder: (BuildContext parentContext) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return ReleasePage(parentContext: parentContext);
            },
          );
        }
    );
  }
}
