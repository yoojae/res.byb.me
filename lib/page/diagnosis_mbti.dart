import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:res_byb_me/global_assets/global_style.dart';
import 'package:res_byb_me/services/mbti_api_service.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:res_byb_me/models/mbti_model_question.dart';

class DiagnosisMbti extends StatefulWidget {
  DiagnosisMbti({Key? key}) : super(key: key);



  @override
  State<DiagnosisMbti> createState() => _DiagnosisMbtiState();
}

class _DiagnosisMbtiState extends State<DiagnosisMbti> {
  List<Datum> _datum = <Datum>[];
  bool loading = false;

  final PageController _pageController = PageController();
  int currentIndex = 0;

  static const duration = const Duration(milliseconds: 100);
  static const curve = Curves.ease;




  @override
  void initState() {
    super.initState();
    ApiService.getMbti().then((value) {
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
            child: Text('두피 MBTI 진단', style: TextStyle(
              color: GlobalStyle.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
      ),
      body: Center(
        child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) => setState(() => currentIndex = index),
          itemCount: _datum.length,
          itemBuilder: (context, index) {
            Datum datum = _datum[index];
            return Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 35),
                color: GlobalStyle.transparent,
                child: Column(
                  crossAxisAlignment: desk ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                  children: [
                    Container(height: 35,),
                    Row(
                      mainAxisAlignment: desk ? MainAxisAlignment.start : MainAxisAlignment.center,
                      children: [
                        ResponsiveRowColumn(
                          layout: desk ? ResponsiveRowColumnType.ROW : ResponsiveRowColumnType.COLUMN,
                          children: [
                            ResponsiveRowColumnItem(
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: desk ? GlobalStyle.light_gray : GlobalStyle.transparent,
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                    child: Text('${datum.mbtiCategory}',
                                      style: TextStyle(
                                        fontSize: desk ? 13 : 25,
                                        color: desk ? GlobalStyle.white : GlobalStyle.black,
                                      ),
                                    )
                                ),
                            ),
                            ResponsiveRowColumnItem(
                                child: Container(width: 5,),
                            ),
                            ResponsiveRowColumnItem(
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: GlobalStyle.intro_txt_gray,
                                    ),
                                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                                    child: Text("${currentIndex + 1} / ${_datum.length} 문항",
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: GlobalStyle.white,
                                      ),
                                    )
                                ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Container(height: desk ? 25 : 50,),
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
                          child: Text('${datum.question}', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: GlobalStyle.black,
                            fontSize: 19,
                          ),),
                        ),
                      ],
                    ),
                    Container(
                      width: desk ? double.infinity : 600,
                      margin: EdgeInsets.only(top: desk ? 25 : 50),
                      child: Row(
                        children: [
                          Flexible(
                            flex: 1,
                            child: TextButton(
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                  color: GlobalStyle.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [BoxShadow(
                                   offset: Offset(0, 1),
                                    color: GlobalStyle.light_gray.withOpacity(0.3),
                                    blurRadius: 3.0,
                                  )]
                                ),
                                child: Center(
                                  child: Text('YES', style: TextStyle(
                                    fontSize: 14,
                                    color: GlobalStyle.light_gray.withOpacity(0.5),
                                  ),),
                                ),
                              ),
                              onPressed: () {
                                _pageController.nextPage(
                                    duration: duration,
                                    curve: curve,
                                );
                              },
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: TextButton(
                              child: Container(
                                height: 45,
                                decoration: BoxDecoration(
                                    color: GlobalStyle.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [BoxShadow(
                                      offset: Offset(0, 1),
                                      color: GlobalStyle.light_gray.withOpacity(0.3),
                                      blurRadius: 3.0,
                                    )]
                                ),
                                child: Center(
                                  child: Text('NO', style: TextStyle(
                                    fontSize: 14,
                                    color: GlobalStyle.light_gray.withOpacity(0.5),
                                  ),),
                                ),
                              ),
                              onPressed: () {
                                _pageController.nextPage(
                                  duration: duration,
                                  curve: curve,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),

                  ],
                )
              ),
            );
          },
        ),
      ),
    );
  }
}
