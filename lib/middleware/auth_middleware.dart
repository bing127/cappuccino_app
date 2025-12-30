import 'package:cappuccino/service/service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_routes.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  int? priority = 0;

  AuthMiddleware({this.priority});
  @override
  RouteSettings? redirect(String? route) {
    if(Service.isLogin) {
      return const RouteSettings(name: Routes.splash);
    } else {
      return const RouteSettings(name:Routes.login);
    }

  }

  @override
  GetPage? onPageCalled(GetPage? page) {
    return super.onPageCalled(page);
  }
}