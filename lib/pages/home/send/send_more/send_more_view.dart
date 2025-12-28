import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'send_more_logic.dart';

class SendMorePage extends StatelessWidget {
  const SendMorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: SendMoreLogic(),
      assignId: true,
      builder: (SendMoreLogic logic) {
        return GridView(
          shrinkWrap: true,
          primary: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 6,
              childAspectRatio: 0.7,
              mainAxisSpacing: 6
          ),
          children: [
            _cardItem(),
            _cardItem(),
            _cardItem(),
            _cardItem(),
            _cardItem(),
            _cardItem(),
            _cardItem(),
            _cardItem(),
            _cardItem(),
            _cardItem(),
            _cardItem(),
            _cardItem(),
            _cardItem(),
            _cardItem(),
            _cardItem(),
            _cardItem(),
            _cardItem(),
            _cardItem(),
            _cardItem(),
            _cardItem(),
            _cardItem(),
            _cardItem(),
            _cardItem(),
            _cardItem(),
          ],
        );
      },
    );
  }

  Widget _cardItem() {
    return Column(
      children: [
        Container(
          height: 180,
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.symmetric(vertical: 16),
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
              image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/70k.png"))),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage("assets/images/YAj.png"),
                radius: 20,
              ),
              Padding(
                padding: EdgeInsets.only(top: 4, left: 10, right: 10),
                child: Text(
                  "一尾流莺一尾流莺一尾流莺一尾流莺",
                  style: TextStyle(
                      color: Colors.white, height: 1, fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
