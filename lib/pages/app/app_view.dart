import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

import 'package:oktoast/oktoast.dart';
import 'package:cappuccino/constants/colors.dart';
import 'package:cappuccino/routes/app_pages.dart';
import 'package:cappuccino/routes/app_routes.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import 'app_binding.dart';
import 'app_logic.dart';

class AppPage extends GetView<AppLogic> {
  const AppPage({super.key});


  @override
  Widget build(BuildContext context) {
    Locale? deviceLocale = Get.deviceLocale;
    print(deviceLocale);
    return RefreshConfiguration(
      footerTriggerDistance: 15,
      dragSpeedRatio: 0.91,
      enableScrollWhenRefreshCompleted: true,
      enableBallisticLoad: true,
      footerBuilder:() => const ClassicFooter(
          noDataText: '-The End-'
      ),
      shouldFooterFollowWhenNotFull: (state) {
        return false;
      },
      child: OKToast(
        child: GetMaterialApp(
          showPerformanceOverlay: false,
          debugShowCheckedModeBanner: false,
          enableLog: true,
          initialRoute: Routes.app,
          getPages: AppPages.routes,
          defaultTransition: Transition.cupertino,
          initialBinding: AppBinding(),
          unknownRoute: AppPages.unknownRoute,
          theme: ThemeData(
              iconTheme: IconThemeData(
                  color: Colors.black.withOpacity(0.5)
              ),
              textButtonTheme: TextButtonThemeData(
                  style: ButtonStyle(
                      overlayColor: MaterialStatePropertyAll(BasicColor.mainColor.withOpacity(0.05))
                  )
              ),
              appBarTheme: AppBarTheme(
                backgroundColor: BasicColor.lightBgColor,
                titleTextStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black
                ),
              ),
              scaffoldBackgroundColor: BasicColor.lightBgColor,
              primaryColor: BasicColor.mainColor
          ),
          // darkTheme: darkTheme,
          builder: EasyLoading.init(builder: (context, widget) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
              child: widget!,
            );
          }),
          localizationsDelegates: const [
            RefreshLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          locale: deviceLocale,
          supportedLocales: const [
            Locale('zh', 'CN'), // Chinese
            Locale('en', 'US'), // English
          ],
        ),
        // child: AdaptiveTheme(
        //     light: ThemeData(
        //         useMaterial3: true,
        //         brightness: Brightness.light,
        //         iconTheme: IconThemeData(
        //             color: Colors.black.withOpacity(0.5)
        //         ),
        //         appBarTheme: AppBarTheme(
        //             backgroundColor: BasicColor.lightBgColor,
        //             titleTextStyle: TextStyle(
        //                 fontSize: 16,
        //                 color: Colors.black
        //             ),
        //         ),
        //         scaffoldBackgroundColor: BasicColor.lightBgColor,
        //         primaryColor: BasicColor.mainColor
        //     ),
        //     dark: ThemeData(
        //         useMaterial3: true,
        //         brightness: Brightness.dark,
        //         iconTheme: IconThemeData(
        //           color: Colors.white.withOpacity(0.5)
        //         ),
        //         appBarTheme: AppBarTheme(
        //           backgroundColor: BasicColor.darkBgColor,
        //           titleTextStyle: TextStyle(
        //               fontSize: 16,
        //               color: Colors.white
        //           ),
        //         ),
        //         scaffoldBackgroundColor: BasicColor.darkBgColor,
        //         primaryColor: BasicColor.mainColor
        //     ),
        //     initial: AdaptiveThemeMode.light,
        //     builder: (theme, darkTheme) =>
        // )
      ),
    );
  }
}
