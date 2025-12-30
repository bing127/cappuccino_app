import 'package:flutter/material.dart';


class ShopViewModel {
   final String text;
   final GlobalKey key;
   late double min;
   late double max;
   ShopViewModel({required this.min, required this.max,required this.text, required this.key});
}


class ShopLocationOffset {
   late double min;
   late double max;
   late double height;
   ShopLocationOffset({required this.min, required this.max, required this.height});
}