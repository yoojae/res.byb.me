import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:res_byb_me/page/diagnosis_area.dart';
import 'package:res_byb_me/page/diagnosis_condition.dart';
import 'package:res_byb_me/page/diagnosis_mbti.dart';
import 'package:res_byb_me/page/login/login_page.dart';
import 'package:res_byb_me/page/start_diagnosis/start_mbti_diagnosis.dart';
import 'package:res_byb_me/page/step_1_diagnosis.dart';
import 'package:res_byb_me/page/step_2_diagnosis.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => StepOne(),
      ),
      GoRoute(
        path: '/step2',
        builder: (context, state) => StepTwo(),
      ),


      GoRoute(
        path: '/loginpage',
        builder: (context, state) => LoginPage(),
      ),


      GoRoute(
        path: '/startmbti',
        builder: (context, state) => StartMbtiDiagnosis(),
      ),

      GoRoute(
        path: '/condition',
        builder: (context, state) => DiagnosisCondition(),
      ),
      GoRoute(
        path: '/mbti',
        builder: (context, state) => DiagnosisMbti(),
      ),
      GoRoute(
        path: '/area',
        builder: (context, state) => DiagnosisArea(),
      ),
    ]
);


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      builder: (context, child) => ResponsiveBreakpoints.builder(
              child: MaterialApp.router(
                routerConfig: _router,
                debugShowCheckedModeBanner: false,
              ),
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 1920, name: DESKTOP),
            ],
         )
       );
    }
  }


