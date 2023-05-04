import 'package:flutter/material.dart';
import 'package:res_byb_me/widget/start_dialog.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:go_router/go_router.dart';
import '../../global_assets/global_style.dart';

class StartMbtiDiagnosis extends StatefulWidget {
  const StartMbtiDiagnosis({Key? key}) : super(key: key);

  @override
  State<StartMbtiDiagnosis> createState() => _StartMbtiDiagnosisState();
}

class _StartMbtiDiagnosisState extends State<StartMbtiDiagnosis> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  static const duration = const Duration(milliseconds: 100);
  static const curve = Curves.ease;


  @override
  Widget build(BuildContext context) {
    var desk = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    return Scaffold(
      appBar: AppBar(
        leading: ResponsiveVisibility(
          visible: desk ? true : false,
          child: TextButton(
            onPressed: () {
              _pageController.previousPage(
                duration: duration,
                curve: curve,
              );
            },
            child: Icon(Icons.arrow_back_ios_new_rounded, color: GlobalStyle.white,),
          ),
        ),
        actions: [
          ResponsiveVisibility(
            visible: desk ? true : false,
            child: TextButton(
              onPressed: () => context.go('/step2'),
              child: Icon(Icons.close_rounded, color: GlobalStyle.white, size: 28,),
            ),
          ),
        ],
        elevation: 0,
        backgroundColor: desk ? GlobalStyle.green : GlobalStyle.transparent,
        title: ResponsiveVisibility(
          visible: desk ? true : false,
          child: Center(
            child: Text('두피 MBTI 진단', style: TextStyle(
              color: GlobalStyle.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 200,
                color: GlobalStyle.green,
              ),
              Container(
                width: double.infinity,
                height: 400,
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 70),
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(
                      offset: Offset(0, 1),
                      color: GlobalStyle.light_gray.withOpacity(0.3),
                      blurRadius: 3.0,
                    )],
                  borderRadius: BorderRadius.circular(10),
                  color: GlobalStyle.white,
                ),
                child: Column(
                  children: [
                    Text('두피 MBTI 진단')
                  ],
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              showDialog(context: context, builder: (context) => StartDialog(),);
            },
            child: Container(
              width: 200,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: GlobalStyle.green,
              ),
              child: Center(
                  child: Text('진단하기', style: TextStyle(
                    color: GlobalStyle.white,
                  ),)
              ),
            ),
          ),
        ],
      )
    );
  }
}

