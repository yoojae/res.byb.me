import 'package:get/get.dart';
import 'package:res_byb_me/global_assets/global_style.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../main.dart';

class StepOne extends StatelessWidget {
  const StepOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var desk = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    return Scaffold(
      body: Padding(
        padding: desk ? EdgeInsets.symmetric(horizontal: 30) : EdgeInsets.symmetric(horizontal: 0),
        child: Center(
          child: Container(
            width: desk ? double.infinity : 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: desk ? CrossAxisAlignment.center : CrossAxisAlignment.start,
              children: [
                Text(
                  '바야바즈!',
                  style: TextStyle(
                    fontSize: desk ? 27 : 34,
                    color: GlobalStyle.light_black,
                  ),
                ),
                Text(
                  '내 두피 상태를 알려줘!',
                  style: TextStyle(
                    fontSize: desk ? 27 : 38,
                    fontWeight: FontWeight.bold,
                    color: GlobalStyle.light_black,
                  ),
                ),

                Container(
                  height: desk ? 35 : 40,
                ),
                ResponsiveVisibility(
                  visible: desk ? true : false,
                  child: Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 30, bottom: 20),
                          child: Image.asset('images/bayabas.png', width: 90,)
                      ),
                      Positioned(
                        top: 55,
                        left: 60,
                        child: Transform.rotate(
                          angle: 6.6,
                          child: const Icon(Icons.search_rounded,
                            color: GlobalStyle.light_gray,
                            size: 70,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: desk ? 20 : 50,
                ),
                Container(
                  width: desk ? 600 : double.infinity,
                  padding: desk ? EdgeInsets.symmetric(vertical: 40, horizontal: 25) : EdgeInsets.symmetric(vertical: 0, horizontal: 0),
                  decoration: BoxDecoration(
                    color: desk ? GlobalStyle.white : GlobalStyle.transparent,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [BoxShadow(
                      color: desk ? GlobalStyle.gray : GlobalStyle.transparent,
                      offset: Offset(0,1),
                      blurRadius: 1.0,
                    )],
                  ),
                  child: Column(
                    crossAxisAlignment: desk ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                    children: [
                      Text(
                        '바야바즈가 제공하는 두피 진단은',
                        style: TextStyle(
                          fontSize: desk ? 14 : 20,
                          color: GlobalStyle.light_black,
                        ),
                      ),
                      Text(
                        '유전적 요인, 생활 패턴, 스트레스, 두피 타입 등을',
                        style: TextStyle(
                          fontSize: desk ? 14 : 20,
                          color: GlobalStyle.light_black,
                        ),
                      ),
                      Text(
                        '파악하여 현재 두피의 상태와 건강을 진단해요.',
                        style: TextStyle(
                          fontSize: desk ? 14 : 20,
                          color: GlobalStyle.light_black,
                        ),
                      ),
                      Container(
                        height: 30,
                      ),
                      Text(
                        '두피 질병 및 질환은 의료기관을 방문 해 주세요.',
                        style: TextStyle(
                          fontSize: desk ? 14 : 18,
                          color: GlobalStyle.intro_txt_gray,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 35,
                ),
                GestureDetector(
                  onTap: () => Get.rootDelegate.toNamed(Routes.STEP2),
                  child: Container(
                    width: desk ? 150 : 410,
                    height: 50,
                    decoration: BoxDecoration(
                        color: desk ? GlobalStyle.green : GlobalStyle.white,
                        borderRadius: desk ? BorderRadius.circular(10) : BorderRadius.circular(0),
                        border: Border.all(
                          width: desk ? 0 : 1,
                          color: desk ? GlobalStyle.transparent : GlobalStyle.intro_border_gray,
                        )),
                    child: Center(
                      child: Text(
                        '진단 구경하기',
                        style: TextStyle(
                          fontSize: 15,
                          color: desk ? GlobalStyle.white : GlobalStyle.intro_txt_gray,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
