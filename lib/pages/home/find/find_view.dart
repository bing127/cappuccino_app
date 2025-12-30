import 'package:cappuccino/components/cache_widget.dart';
import 'package:cappuccino/components/card_item.dart';
import 'package:cappuccino/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import 'find_logic.dart';

class FindPage extends StatelessWidget {
  const FindPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: FindLogic(),
      assignId: true,
      builder: (FindLogic logic) {
        return CacheWidget(child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: StaggeredGrid.count(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: logic.state.CardList.asMap().values.map((CardItemJumpParams e) {
                return CardItem(cardType: e.cardType, picture: e.picture, text: e.text ?? '', avatar: e.avatar, like: e.like ?? 0, username: e.username ?? '', tap: (CardItemJumpParams params) {
                  Get.toNamed('${Routes.home}${e.cardType == CardType.video ? Routes.homeVideo : Routes.homeArticle}',
                      arguments:params.toJson());
                },);
            }).toList(),
          ),
        ));
      },
    );
  }
}
