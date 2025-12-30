import 'package:cappuccino/api/common_api.dart';
import 'package:cappuccino/bean/city_bean.dart';
import 'package:get/get.dart';

import 'area_state.dart';

class AreaLogic extends GetxController {
  final AreaState state = AreaState();

  @override
  void onReady() {
    getCity();
    super.onReady();
  }

  void getCity() {
    CommonApi.getCity(Get.arguments['province'], Get.arguments['city'], Get.arguments['area']).then((value) {
      if (Get.arguments['level'] == 'province') {
        state.cityList.value = value!;
      } else if (Get.arguments['level'] == 'city') {
        state.cityList.value = value!.where((CityBean element) => element.city != "0").toList();
      }
      else if (Get.arguments['level'] == 'area') {
        state.cityList.value = value!.where((CityBean element) => element.area != "0").toList();
      }
    });
  }
}
