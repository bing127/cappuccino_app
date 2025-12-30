import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SearchState {
  Rx<TextEditingController> searchTextEditingController = TextEditingController().obs;
  RxBool isClear = false.obs;
  SearchState() {
    ///Initialize variables
  }
}
