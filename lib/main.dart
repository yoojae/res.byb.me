import 'dart:js';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:res_byb_me/page/step_1_diagnosis.dart';
import 'package:res_byb_me/page/step_2_diagnosis.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

abstract class Routes {
  static const HOME = '/';
  static const STEP2 = '/steptwo';
}

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.HOME,
      page: () => StepOne(),
    ),
    GetPage(
      name: Routes.STEP2,
      page: () => StepTwo(),
    ),
  ];
}

class AppRouterDelegate extends GetDelegate {
  @override
  Widget build(BuildContext context) {
    return Navigator(
      onPopPage: (route, result) => route.didPop(result),
      pages: currentConfiguration != null
          ? [currentConfiguration!.currentPage!]
          : [GetNavConfig.fromRoute(Routes.HOME)!.currentPage!],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
              child: GetMaterialApp.router(
                debugShowCheckedModeBanner: false,
                getPages: AppPages.pages,
                routerDelegate: AppRouterDelegate(),
              ),
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 1920, name: DESKTOP),
            ],
         )
       );
    }
  }


