import 'package:cappuccino/components/base_modal/base_modal_func.dart';
import 'package:cappuccino/constants/colors.dart';
import 'package:cappuccino/pages/login/login_view.dart';
import 'package:cappuccino/routes/app_routes.dart';
import 'package:cappuccino/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'setting_logic.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SettingLogic(),
      assignId: true,
      builder: (SettingLogic logic) {
        return SafeArea(
          top: false,
          bottom: false,
          child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              automaticallyImplyLeading: false,
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
              leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    RemixIcon.arrow_left_s_outline,
                    color: BasicColor.darkBgColor,
                    size: 20,
                  )),
              title: Text(
                "设置",
                style: TextStyle(fontSize: 16),
              ),
            ),
            body: ListView(
              children: [
                _block(child: [
                  _blockItem('账号与安全', bordered: true),
                  _blockItem('隐私设置', bordered: false)
                ]),
                _block(child: [
                  _blockItem('通知设置'),
                  _blockItem('添加小组件'),
                  _blockItem('通用设置', bordered: false),
                ]),
                _block(child: [
                  _blockItem('青少年模式'),
                  _blockItem('深色模式', tap: () {
                    Get.toNamed('${Routes.my}${Routes.mySetting}${Routes.mySettingTheme}');
                  }),
                  _blockItem('字体大小', bordered: false)
                ]),
                _block(child: [
                  _blockItem('帮助与客服'),
                  _blockItem('鼓励一下'),
                  _blockItem('个人信息收集清单'),
                  _blockItem('第三方信息共享清单'),
                  _blockItem('关于此刻'),
                  _blockItem('当前版本', value: "V0.0.1", bordered: false)
                ]),
                _logout(context)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _block({required List<Widget> child}) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          margin: const EdgeInsets.only(left: 12, right: 12, top: 10),
          child: Column(
            children: child,
          ),
        ));
  }

  Widget _blockItem(String label, {String? value, bool? bordered = true, void Function()? tap}) {
    ThemeData theme = Theme.of(Get.context as BuildContext);
    return Material(
      color: theme.cardColor,
      shape: UnderlineInputBorder(
          borderSide: BorderSide(
              color: bordered == true ? theme.dividerColor.withOpacity(0.2) : Colors.transparent,
              width: 0.5)),
      child: InkWell(
        onTap: () {
          if(tap != null) {
            tap();
          }
        },
        child: Container(
          color: Colors.transparent,
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 14),
              ),
              Row(
                children: [
                  value != null
                      ? Text(
                          value,
                          style: TextStyle(fontSize: 13, color: theme.textTheme.bodySmall?.color?.withOpacity(0.6)),
                        )
                      : const SizedBox.shrink(),
                  Icon(
                    RemixIcon.arrow_right_s_outline,
                    color: Theme.of(Get.context as BuildContext).dividerColor.withOpacity(0.16),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _logout(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 30,
        left: 12,
        right: 12,
      ),
      child: ClipRRect(
        child: Material(
          color: Theme.of(Get.context as BuildContext).cardColor,
          child: InkWell(
            onTap: () {
              BaseModalFunc.showModal(context, showTitle: false, contentChild: const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 12
                  ),
                  child: Text(
                    "确定退出登录？",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                    ),
                  ),
                ),
              ), confirmFunc: (logic, close) {
                close().then((value) {
                  JSpUtil.clear();
                  Get.offAll(const LoginPage(), transition: Transition.circularReveal, duration:  Duration.zero);
                });
              });
            },
            child: Container(
              alignment: Alignment.center,
              color: Colors.transparent,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
              child: Text(
                '退出登录',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
