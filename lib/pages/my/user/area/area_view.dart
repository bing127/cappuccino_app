import 'package:cappuccino/constants/colors.dart';
import 'package:cappuccino/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remix_icon_icons/remix_icon_icons.dart';

import 'area_logic.dart';

class AreaPage extends StatelessWidget {
  const AreaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        assignId: true,
        tag: "user_city_${Get.arguments['province']}_${Get.arguments['city']}_${Get.arguments['ares']}",
        initState: (GetBuilderState<AreaLogic>? state) {},
        init: AreaLogic(),
        builder: (AreaLogic logic) {
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
                  "选择地区",
                  style: GoogleFonts.roboto(fontSize: 16),
                ),
              ),
              backgroundColor: const Color(0xfff2f2f2),
              body: Container(
                  padding: const EdgeInsets.all(12),
                  width: double.infinity,
                  child: Container(
                      padding: const EdgeInsets.all(12),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(6)),
                      child: Obx(() => ListView.builder(
                            itemCount: logic.state.cityList.length,
                            itemBuilder: (_, int index) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 13
                                ),
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Colors.black.withOpacity(0.1), width: 0.5))
                                ),
                                width: double.infinity,
                                child: InkWell(
                                  onTap: () {
                                    List<String> filterCityList = ['71', '82', '81', '11', '12'];
                                    Map<String, String> routerParams = {};
                                    if( Get.arguments['level'] == 'province') {
                                      routerParams['level'] = "city";
                                      routerParams['province'] = "${logic.state.cityList[index].province}";
                                      if(filterCityList.contains(logic.state.cityList[index].province)) {
                                        routerParams['city'] = "";
                                        routerParams['area'] = "";
                                      } else {
                                        routerParams['city'] = "";
                                        routerParams['area'] = "0";
                                      }
                                    } else {
                                      routerParams['level'] = "area";
                                      routerParams['province'] = Get.arguments['province'];
                                      routerParams['city'] = "${logic.state.cityList[index].city}";
                                      routerParams['area'] = "";
                                    }
                                    if(Get.arguments['level'] == 'city' &&  filterCityList.contains(logic.state.cityList[index].province)) {
                                      return;
                                    }

                                    if(Get.arguments['level'] == 'area') {
                                      return;
                                    }
                                    Get.toNamed("${Routes.my}${Routes.myUser}${Routes.myUserArea}",
                                        arguments: routerParams, preventDuplicates: false);
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                          "${logic.state.cityList[index].name}"),
                                      Get.arguments['level'] != 'area' ? Icon(
                                        Icons.keyboard_arrow_right_outlined,
                                        weight: 100,
                                        color: Colors.black.withOpacity(0.15),
                                        size: 22,
                                      ) : const SizedBox.shrink()
                                    ],
                                  ),
                                ),
                              );
                            },
                          )))),
            ),
          );
        });
  }
}
