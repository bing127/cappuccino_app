import 'package:cappuccino/components/app_image/app_image.dart';
import 'package:cappuccino/constants/colors.dart';
import 'package:cappuccino/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

import 'user_logic.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<UserLogic>();
    final state = Get.find<UserLogic>().state;

    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              automaticallyImplyLeading: false,
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
                "编辑资料",
                style: GoogleFonts.roboto(fontSize: 16),
              ),
            ),
            body: ListView(children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 30),
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () async {
                    final List<AssetEntity>? result =
                        await AssetPicker.pickAssets(
                      context,
                      pickerConfig: AssetPickerConfig(
                        specialPickerType: SpecialPickerType.wechatMoment,
                        maxAssets: 1,
                      ),
                    );
                    if(result != null) {
                      logic.state.avatar.value = result!;
                      logic.cropImage(context);

                    }
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black.withOpacity(0.3), width: 1),
                            borderRadius: BorderRadius.circular(60)),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: Obx(() => state.userInfo.value.user?.avatar != null ? AppImage(
                              image: NetworkImage(state.userInfo.value.user!.avatar as String), fit: BoxFit.cover,
                            ): Image.asset("assets/images/logo_transparent.png")),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 70,
                        left: 80,
                        child: Container(
                          width: 26,
                          height: 26,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(100)),
                          child: const Icon(RemixIcon.camera_outline,
                              color: Colors.white, size: 16),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Obx(() => _listItem("名称", value: state.userInfo.value.user?.nickName, () {
                Get.toNamed("${Routes.my}${Routes.myUser}${Routes.myUserNickName}", arguments: {
                  'value': state.userInfo.value.user?.nickName,
                  'id': state.userInfo.value.user?.id,
                });
              })),
              Obx(() => _listItem("简介", value: state.userInfo.value.user?.profile, () {
                Get.toNamed("${Routes.my}${Routes.myUser}${Routes.myUserProfile}", arguments: {
                  'value': state.userInfo.value.user?.profile,
                  'id': state.userInfo.value.user?.id,
                });
              })),
              _listItem("性别", value: state.userInfo.value.user?.sex, () {}),
              _listItem("生日", value: state.userInfo.value.user?.birthday, () {}),
              _listItem("地区", () {
                Get.toNamed("${Routes.my}${Routes.myUser}${Routes.myUserArea}",
                    arguments: <String, String>{
                      'level': 'province',
                      'province': "",
                      'city': "0",
                      'area': "0",
                    });
              }),
            ])));
  }

  Widget _listItem(String label, void Function() onTap, { String? value }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: Colors.black.withOpacity(0.1), width: 0.5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: GoogleFonts.roboto(fontSize: 14),
            ),
            Row(
              children: [
                value != null ? Text(
                  value,
                  style: GoogleFonts.roboto(fontSize: 14),
                ) : const SizedBox.shrink(),
                Icon(
                  Icons.keyboard_arrow_right_outlined,
                  weight: 100,
                  color: Colors.black.withOpacity(0.15),
                  size: 22,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
