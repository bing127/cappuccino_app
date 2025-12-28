import 'package:cappuccino/bean/user_place_bean.dart';
import 'package:cappuccino/bean/video_edit_bean.dart';
import 'package:cappuccino/components/gesture_detector_view.dart';
import 'package:cappuccino/constants/colors.dart';
import 'package:cappuccino/pages/release/release_state.dart';
import 'package:cappuccino/routes/app_routes.dart';
import 'package:cappuccino/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

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
        return GestureDetectorView(
            child: Container(
          color: Colors.white,
          padding: EdgeInsets.only(top: Get.mediaQuery.padding.top),
          child: Scaffold(
            appBar: AppBar(
              elevation: 0.0,
              centerTitle: true,
              surfaceTintColor: Colors.white,
              backgroundColor: Colors.white,
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
                "发表",
                style: GoogleFonts.roboto(fontSize: 16),
              ),
            ),
            backgroundColor: Colors.white,
            body: ListView(
              children: [
                _picture(context, logic.state),
                _input(logic.state.titleController.value),
                _input(logic.state.contentController.value, isTitle: false),
                _location(logic.state.placeList),
              ],
            ),
            bottomNavigationBar: Container(
              margin: EdgeInsets.only(
                  left: 30, right: 30, bottom: Get.mediaQuery.padding.bottom),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(46),
                child: Material(
                  color: BasicColor.mainColor,
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      height: 46,
                      width: double.infinity,
                      child: const Text(
                        "发表此刻",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
      },
    );
  }

  Widget _location(List<UserPlaceBean> placeBean) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _locationPicker(),
          _locationTag(placeBean),
        ],
      ),
    );
  }

  Widget _locationPicker() {
    return const InkWell(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                Icon(RemixIcon.map_pin_outline, size: 18, weight: 100),
                Padding(
                  padding: EdgeInsets.only(left: 8),
                  child: Text("添加附近地点", style: TextStyle(fontSize: 16)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _locationTag(List<UserPlaceBean> placeBean) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: placeBean.asMap().values.map((e) => _locationTagItem(e.name!)).toList(),
    );
  }

  Widget _locationTagItem(String text) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.18),
          borderRadius: BorderRadius.circular(30)),
      child: InkWell(
        child: Text(
          text,
          style: TextStyle(color: Colors.grey.withOpacity(0.9)),
        ),
      ),
    );
  }

  Widget _input(TextEditingController controller, {bool? isTitle = true}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      padding: EdgeInsets.zero,
      decoration: const BoxDecoration(
          border:
              Border(bottom: BorderSide(color: Color(0xffcecece), width: 0.5))),
      child: TextField(
        controller: controller,
        maxLines: isTitle == true ? 2 : 8,
        maxLength: isTitle == true ? 100 : 600,
        scrollPadding: EdgeInsets.zero,
        cursorColor: BasicColor.mainColor,
        decoration: InputDecoration(
          hintText: isTitle == true ? '填写标题会有更多赞哦～' : '添加正文',
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.6)),
          constraints: BoxConstraints(
            minHeight: isTitle == true ? 76 : 220,
            maxHeight: isTitle == true ? 200 : 500,
          ),
        ),
      ),
    );
  }

  Widget _picture(BuildContext context, ReleaseState state) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Obx(() => Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              ...state.assetsList.asMap().values.map((e) {
                return _pictureItem(picture: e);
              }),
              state.assetsList.length >= 3
                  ? const SizedBox.shrink()
                  : _pictureItem(
                      isAdd: true,
                      tap: () async {
                        final List<AssetEntity>? result =
                            await AssetPicker.pickAssets(
                          context,
                          pickerConfig: AssetPickerConfig(
                            specialPickerType: SpecialPickerType.wechatMoment,
                            maxAssets: 3,
                          ),
                        );
                        SystemChrome.setSystemUIOverlayStyle(Utils.light);
                        if (result != null) {
                          if (result.any(
                              (element) => element.type == AssetType.video)) {
                            var file = await result.first.file;
                            var backParams = await Get.toNamed(Routes.homeVideoEdit,
                                arguments: {"file": file});
                           if(backParams != null) {
                              print(VideoEditBean.fromJson(backParams));
                           }
                          } else {
                            state.assetsList.addAll(result);
                            state.assetsList.value = state.assetsList
                                .sublist(state.assetsList.length - 3);
                          }
                        }
                      }),
            ],
          )),
    );
  }

  Widget _pictureItem(
      {bool? isAdd, AssetEntity? picture, void Function()? tap}) {
    double width = (Get.width - 12 * 2 - 10 * 2) / 3;
    return InkWell(
      onTap: () {
        if (tap != null) {
          tap();
        }
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: width,
            height: width,
            decoration: BoxDecoration(
                color: const Color(0xfff6f6f6),
                border: Border.all(
                    color: Colors.grey.withOpacity(0.16), width: 0.5),
                borderRadius: BorderRadius.circular(6)),
            child: isAdd == true
                ? Icon(RemixIcon.add_box_outline,
                    color: Colors.grey.withOpacity(0.3), size: 36)
                : ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: picture != null
                        ? FutureBuilder(
                            future: picture.thumbnailData,
                            builder: (_, snapshot) {
                              if (snapshot.hasData) {
                                return Image.memory(
                                  snapshot.data!,
                                  fit: BoxFit.fill,
                                );
                              } else {
                                return const SizedBox.shrink();
                              }
                            })
                        : const SizedBox.shrink(),
                  ),
          ),
          isAdd == true
              ? const SizedBox.shrink()
              : Positioned(
                  top: -15,
                  right: -12,
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(BasicColor.mainColor),
                      fixedSize: const MaterialStatePropertyAll(Size(30, 30)),
                      maximumSize: const MaterialStatePropertyAll(Size(30, 30)),
                      minimumSize: const MaterialStatePropertyAll(Size(30, 30)),
                    ),
                    icon: const Icon(
                      RemixIcon.delete_bin_2_outline,
                      color: Colors.white,
                      size: 16,
                    ),
                    onPressed: () {},
                  ),
                )
        ],
      ),
    );
  }
}
