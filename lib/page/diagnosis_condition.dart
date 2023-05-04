import 'package:go_router/go_router.dart';
import 'package:res_byb_me/global_assets/global_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:res_byb_me/models/condition_model_question.dart';
import 'package:res_byb_me/services/condition_api_service.dart';


class DiagnosisCondition extends StatefulWidget {
  const DiagnosisCondition({Key? key}) : super(key: key);

  @override
  State<DiagnosisCondition> createState() => _DiagnosisConditionState();
}

class _DiagnosisConditionState extends State<DiagnosisCondition> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  static const duration = const Duration(milliseconds: 100);
  static const curve = Curves.ease;

  bool first = false;
  bool second = false;
  bool third = false;
  bool fourth = false;
  bool fifth = false;

  List<Datum> _datum = <Datum>[];
  bool loading = false;

  @override
  void initState() {
    super.initState();
    ApiService.getCondition().then((value) {
      setState(() {
        _datum = value;
        loading = true;
      });
    });
  }

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
            child: Text('두피 상태 진단', style: TextStyle(
              color: GlobalStyle.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 35),
          width: double.infinity,
          child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: (index) => setState(() => currentIndex = index),
              itemCount: _datum.length,
              itemBuilder: (context, index) {
                Datum datum = _datum[index];
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: desk ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                    children: [
                      Container(height: 35,),
                      Row(
                        mainAxisAlignment: desk ? MainAxisAlignment.start : MainAxisAlignment.center,
                        crossAxisAlignment: desk ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Text('Q.', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: GlobalStyle.black,
                              fontSize: 19,
                            ),),
                          ),
                          Container(width: 5,),
                          Flexible(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: desk ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                              children: [
                                Text('${datum.question}', style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: GlobalStyle.black,
                                  fontSize: 19,
                                ),),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(height: desk? 7 : 10,),
                      Row(
                        mainAxisAlignment: desk ? MainAxisAlignment.start : MainAxisAlignment.center,
                        crossAxisAlignment: desk ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                        children: [
                          Flexible(
                            flex: 1,
                            child: Text('Q. ', style: TextStyle(color: GlobalStyle.transparent),),
                          ),
                          Container(width: 5,),
                          Flexible(
                            flex: 10,
                            child: Column(
                              crossAxisAlignment: desk ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                              children: [
                                Text(
                                  datum.questionExplanation, //서브 질문
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: GlobalStyle.dark
                                  ),
                                  // textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Container(height: desk ? 40 : 130,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CheckCircular(
                            checktap: () {
                              setState(() {
                                first = !first;
                                second = false;
                                third = false;
                                fourth = false;
                                fifth = false;
                              });
                            },
                            color: first ? GlobalStyle.light_green : GlobalStyle.gray,
                            text: '전혀 아니에요',
                          ),
                          CheckCircular(
                            checktap: () {
                              setState(() {
                                second = !second;
                                first = false;
                                third = false;
                                fourth = false;
                                fifth = false;
                              });
                            },
                            color: second ? GlobalStyle.light_green : GlobalStyle.gray,
                            text: '아니에요',
                          ),
                          CheckCircular(
                            checktap: () {
                              setState(() {
                                third = !third;
                                first = false;
                                second = false;
                                fourth = false;
                                fifth = false;
                              });
                            },
                            color: third ? GlobalStyle.light_green : GlobalStyle.gray,
                            text: '보통',
                          ),
                          CheckCircular(
                            checktap: () {
                              setState(() {
                                fourth = !fourth;
                                first = false;
                                second = false;
                                third = false;
                                fifth = false;
                              });
                            },
                            color: fourth ? GlobalStyle.light_green : GlobalStyle.gray,
                            text: '그래요',
                          ),
                          CheckCircular(
                            checktap: () {
                              setState(() {
                                fifth = !fifth;
                                first = false;
                                second = false;
                                third = false;
                                fourth = false;
                              });
                            },
                            color: fifth ? GlobalStyle.light_green : GlobalStyle.gray,
                            text: '매우 그래요',
                          ),
                        ],
                      ),
                      Container(height: desk ? 100 : 100,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BtnDiagnosis(
                              onTap: () {
                                _pageController.previousPage(
                                    duration: Duration(milliseconds: 500),
                                    curve: Curves.easeIn
                                );
                              },
                              color: GlobalStyle.gray,
                              text: '이전'),
                          Container(
                            width: 20,
                          ),
                          BtnDiagnosis(
                            onTap: () {
                              _pageController.nextPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn
                              );
                            },
                            color: first || second || third || fourth || fifth
                                ? GlobalStyle.green
                                : GlobalStyle.gray,
                            text: '다음',
                          ),
                        ],
                      )
                    ],
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}


class CheckCircular extends StatefulWidget {
  final GestureTapCallback checktap;
  final Color color;
  final String text;

  const CheckCircular({
    super.key,
    required this.checktap,
    required this.color,
    required this.text,
  });

  @override
  State<CheckCircular> createState() => _CheckCircularState();
}

class _CheckCircularState extends State<CheckCircular> {
  @override
  Widget build(BuildContext context) {
    var desk = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    return Column(
      children: [
        GestureDetector(
          onTap: widget.checktap,
          child: Container(
            width: desk ? 45 : 70,
            height: desk ? 45 : 70,
            decoration: BoxDecoration(
                border: Border.all(
                  color: widget.color,
                  width: desk ? 15 : 18,
                ),
                borderRadius: BorderRadius.circular(100)),
          ),
        ),
        Container(
          height: desk ? 12 : 12,
        ),
        Text(
          widget.text,
          style: TextStyle(
              color: GlobalStyle.gray, fontSize: desk ? 11 : 16),
        )
      ],
    );
  }
}


class BtnDiagnosis extends StatelessWidget {
  final GestureTapCallback onTap;
  final Color color;
  final String text;

  const BtnDiagnosis({
    Key? key,
    required this.onTap,
    required this.color,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var desk = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(
          bottom: desk ? 50 : 150,
        ),
        width: desk ? 100 : 160,
        height: desk ? 40 : 50,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(desk ? 3 : 5)),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: GlobalStyle.white, fontSize: desk ? 14 : 18),
          ),
        ),
      ),
    );
  }
}

