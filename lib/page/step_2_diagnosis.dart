import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../global_assets/global_style.dart';
import '../main.dart';


class StepTwo extends StatefulWidget {
  const StepTwo({Key? key}) : super(key: key);

  @override
  State<StepTwo> createState() => _StepTwoState();
}

class _StepTwoState extends State<StepTwo> {
  @override
  Widget build(BuildContext context) {
    var desk = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: desk ? EdgeInsets.symmetric(horizontal: 30) : EdgeInsets.symmetric(horizontal: 0),
          child: Center(
            child: Column(
              children: [
                Container(height: desk ? 50 : 100,),
                ResponsiveVisibility(
                  visible: desk ? true : false,
                  child: Row(
                    children: [
                      Image.asset('images/pin.png', width: 25, height: 25,),
                      Text(' 바야바즈 진단 테스트',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => context.go('/condition'),
                  child: Contents(
                      title: '두피 건강 테스트',
                      subtitle: '문진을 통해 유전적 요인, 생활 습관, 스트레스, 두피 타입 등을 파악하여 지금 두피의 상태가 어떤지 알아볼 수 있어요.',
                      txt: '내 두피상태 진단',
                      subtxt: '문진을 통해 유전적인 요인, 생활 채턴, 스트레스, 두피타입 등을 파악하여 현재 두피건강을 진단 할 수 있어요',
                      endtxt: '탈모는 조기에 발견해 예방하는 것이 제일 중요해요. 간단한 문진으로 나의 두피 상태를 알아보세요. 바야바즈에서 제공하는 모든 콘텐츠는 진단하신 데이터를 바탕으로 전문가가 추천해 드립니다.',
                      img: 'images/default_diagnosis.png'
                  ),
                ),
                Container(height: desk ? 0 : 70,),
                GestureDetector(
                  onTap: () => context.go('/startmbti'),
                  child: Contents(
                      title: '두피 타입 테스트',
                      subtitle: '두피의 상태를 문진하여 두피 성격과 두피 타입을 파악할 수 있어요.',
                      txt: '탈모MBTI',
                      subtxt: '내 두피는 어떤 성격을 가지고 있을 까요? 간단한 진단을 통해 확인해 보세요.',
                      endtxt: '이제 탈모도 MBTI로 체크할 수 있다는 사실 아시나요? 평소의 "생활 습관"과 "마음상태" 그리고 "유전/질병" 여부, 마지막으로 두피/모발 상태까지 총 40문항의 질문에 대답하면 나만의 탈모 MBTI를 알 수 있어요. 적을 알고 나를 알면 백전백승! 탈모 MBTI를 통해 챙겨야 하는 생활습관과 버려야 하는 습관을 확인하고 꼼꼼하게 관리할 수 있답니다. 바야바즈의 탈모 MBTI를 통해 내 두피와 친해지는 시간을 만들어 보세요!',
                      img: 'images/mbti_diagnosis.png'
                  ),
                ),
                Container(height: desk ? 0 : 70,),
                GestureDetector(
                  onTap: () => context.go('/area'),
                  child: Contents(
                      title: '두피 면적 테스트',
                      subtitle: '정수리 사진을 통해 바야바즈가 두피의 면적을 파악해줘요. 간편하고 쉽게 진단할 수 있어요.',
                      txt: '바야바즈 두피 면적 진단',
                      subtxt: '정수리 사진을 통해 바야바즈가 두피의 면적을 파악해줘요. 간편하고 쉽게 진단할 수 있어요.',
                      endtxt: '간단하게 사진을 찍어 두피 면적 진단을 할 수 있어요.',
                      img: 'images/AI_diagnosis.png'
                  ),
                ),
                Container(height: desk ? 0 : 90,),
              ],
            ),

          ),
        ),
      ),
    );
  }
}




class Contents extends StatelessWidget {
  const Contents({Key? key, required this.title, required this.subtitle, required this.txt, required this.subtxt, required this.endtxt, required this.img}) : super(key: key);

  final String title, subtitle, txt, subtxt, endtxt;
  final img;

  @override
  Widget build(BuildContext context) {
    var desk = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    return Container(
      width: desk ? double.infinity : 1024,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ResponsiveVisibility(
            visible: desk ? false : true,
            child: Text(title,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: GlobalStyle.light_black,
              ),
            ),
          ),
          ResponsiveVisibility(
            visible: desk ? false : true,
            child: Text(subtitle,
              style: TextStyle(
                fontSize: 19,
                color: GlobalStyle.light_gray,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          Container(height: 25,),
          Container(
            padding: desk ? EdgeInsets.symmetric(vertical: 15, horizontal: 15,) : EdgeInsets.fromLTRB(50, 35, 10, 60),
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: desk ? BorderRadius.circular(10) : BorderRadius.circular(30),
                color: GlobalStyle.white,
                boxShadow: [
                  BoxShadow(
                    color: GlobalStyle.light_gray.withOpacity(0.2),
                    blurRadius: 3.0,
                    spreadRadius: 0.0,
                    offset: const Offset(0,2),
                  )
                ]
            ),
            child: Row(
              children: [
                ResponsiveVisibility(
                  visible: desk ? true : false,
                  child: Flexible(
                      flex: 2,
                      child: Image.asset(img, width: 60,)
                  ),
                ),
                Flexible(
                  flex: desk ? 9 : 4,
                  child: Padding(
                    padding: desk ? EdgeInsets.fromLTRB(15, 0, 10, 0) : EdgeInsets.fromLTRB(20, 0, 10, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ResponsiveVisibility(
                          visible: desk ? false : true,
                            child: Container(width: 60, height: 5, color: GlobalStyle.light_purple, margin: EdgeInsets.only(bottom: 15),)
                        ),
                        Text(txt, style: TextStyle(
                          fontSize: desk ? 15 : 19,
                          color: GlobalStyle.light_black,
                          fontWeight: FontWeight.w500,
                        ),
                        ),
                        Container(height: 10,),
                        Text(subtxt, style: TextStyle(
                          fontSize: desk ? 14 : 18,
                          color: GlobalStyle.light_black,
                          fontWeight: FontWeight.w100,
                        ),
                        ),
                        Container(height: 10,),
                        ResponsiveVisibility(
                          visible: desk ? false : true,
                          child: Text(endtxt, style: TextStyle(
                            fontSize: 18,
                            color: GlobalStyle.light_black,
                            fontWeight: FontWeight.w100,
                          ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ResponsiveVisibility(
                  visible: desk ? false : true,
                  child: Flexible(
                    flex: 1,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(img, width: 90, height: 90,)
                        ],
                      ),
                    ),
                  ),
                ),
                ResponsiveVisibility(
                  visible: desk ? true : false,
                  child: Flexible(
                    flex: 1,
                    child: Center(
                      child: Icon(Icons.arrow_forward_rounded, size: 20, color: GlobalStyle.green,),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


