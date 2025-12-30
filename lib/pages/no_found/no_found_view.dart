import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'no_found_logic.dart';

class NoFoundPage extends StatelessWidget {
  const NoFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    final logic = Get.find<NoFoundLogic>();
    final state = Get.find<NoFoundLogic>().state;

    return Container();
  }
}
