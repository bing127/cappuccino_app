import 'package:cappuccino/pages/my/setting/setting_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'more_logic.dart';

class MorePage extends StatelessWidget {
  final Function() callback;
  const MorePage({super.key, required this.callback});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: MoreLogic(),
      assignId: true,
      builder: (MoreLogic logic) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    left: 12,
                    right: 12,
                    top: Get.mediaQuery.padding.top,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _panel([
                        _panelItem(
                            RemixIcon.user_add_outline,
                            "发现好友",
                            tap: () {}
                        )
                      ]),
                      _panel([
                        _panelItem(
                            RemixIcon.file_history_outline,
                            "浏览记录",
                            tap: () {}
                        ),
                        _panelItem(
                            RemixIcon.edit_2_outline,
                            "创作中心",
                            tap: () {}
                        )
                      ]),
                      _panel([
                        _panelItem(
                            RemixIcon.shopping_cart_2_outline,
                            "购物车",
                            tap: () {}
                        ),
                        _panelItem(
                            RemixIcon.file_chart_2_outline,
                            "订单",
                            tap: () {}
                        )
                      ], bordered: false)
                    ],
                  ),
                ),
              )),
              Container(
                padding: EdgeInsets.only(
                  bottom: Get.mediaQuery.padding.bottom,
                  left: 12,
                  right: 12,
                ),
                child: Row(
                  children: [
                    Expanded(child: _cellItem(
                        RemixIcon.settings_outline,
                        "设置",
                        tap: () {
                          callback();
                          Get.to(const SettingPage(), transition: Transition.rightToLeft);
                          // Get.toNamed('${Routes.my}${Routes.mySetting}');
                        }
                    )),
                    Expanded(child: _cellItem(
                        RemixIcon.customer_service_2_outline,
                        "帮助与客服"
                    )),
                    Expanded(child: _cellItem(
                        RemixIcon.qr_scan_2_outline,
                        "扫一扫"
                    )),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Widget _panel(List<Widget> child, { bool? bordered = true }) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10
      ),
      decoration: BoxDecoration(
         border: Border(
           bottom: BorderSide(
              color: bordered == true ? Colors.black.withOpacity(0.1) : Colors.transparent,
              width: 0.5
           )
         )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: child,
      ),
    );
  }

  Widget _panelItem(IconData icon, String text, {void Function()? tap }) {
     return InkWell(
       onTap: tap,
       child: Material(
         color: Colors.transparent,
         child: Container(
           width: double.infinity,
           padding: const EdgeInsets.symmetric(
             vertical: 10
           ),
           child: Wrap(
             spacing: 10,
             alignment: WrapAlignment.start,
             crossAxisAlignment: WrapCrossAlignment.center,
             children: [
               Icon(icon, size: 18,),
               Text(text)
             ],
           ),
         ),
       ),
     );
  }

  Widget _cellItem(IconData icon, String text, {void Function()? tap }) {
    return InkWell(
      onTap: tap,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(
              vertical: 10
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(100)
                ),
                child: Icon(icon, size: 18),
              ),
              Padding(padding: const EdgeInsets.only(top: 3), child: Text(text, style: TextStyle(
                  fontSize: 14
              )),)
            ],
          ),
        ),
      ),
    );
  }
}
