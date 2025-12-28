import 'package:flutter/material.dart';

import 'package:cappuccino/pages/app/app_view.dart';
import 'package:cappuccino/service/service.dart';

Future<void> main() async {
  await initServices();
  runApp(const AppPage());
}

Future<void> initServices() async {
  await Service.init();
}