import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:res_byb_me/global_assets/global_style.dart';
import 'package:res_byb_me/services/mbti_api_service.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:res_byb_me/models/mbti_model_question.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class DiagnosisArea extends StatefulWidget {
  const DiagnosisArea({Key? key}) : super(key: key);

  @override
  State<DiagnosisArea> createState() => _DiagnosisAreaState();
}

class _DiagnosisAreaState extends State<DiagnosisArea> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  static const duration = const Duration(milliseconds: 100);
  static const curve = Curves.ease;

  bool male = false;
  bool female = false;

  bool one = false;
  bool two = false;
  bool three = false;
  bool four = false;
  bool five = false;
  bool six = false;

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
            child: Text('두피 면적 진단', style: TextStyle(
              color: GlobalStyle.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
          ),
        ),
      ),
      body: Container(
        padding: desk ? EdgeInsets.symmetric(horizontal: 35) : EdgeInsets.symmetric(horizontal: 0),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          controller: _pageController,
          children: [
              Column(
                crossAxisAlignment: desk ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                children: [
                  Container(height: desk ? 25 : 50,),
                  Text('정확한 두피 면적 계산을 위해 성별을 입력해 주세요.', style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: GlobalStyle.black,
                    fontSize: 19,
                  ),),
                  Text('바야바즈 두피면적 진단은 성별과 나이대를 토대로 면적이 계산되요.', style: TextStyle(
                    fontSize: 15,
                    color: GlobalStyle.black,
                  ),),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(height: 30,),
                      GestureDetector(
                        onTap:  () {
                          setState(() {
                            male=!male;
                            female=false;
                          });
                        },
                        child: Container(
                          width: desk ? double.infinity : 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: male ? GlobalStyle.green :GlobalStyle.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: GlobalStyle.light_gray.withOpacity(0.1),
                            ),
                          ),
                          child: Center(
                              child: Text('남자', style: TextStyle(
                                fontSize: 16,
                                color: male ? GlobalStyle.white : GlobalStyle.light_gray,
                              ),)
                          ),
                        ),
                      ),
                      Container(height: 15,),
                      GestureDetector(
                        onTap:  () {
                          setState(() {
                            female=!female;
                            male=false;
                          });
                        },
                        child: Container(
                          width: desk ? double.infinity : 300,
                          height: 50,
                          decoration: BoxDecoration(
                            color: female ? GlobalStyle.green :GlobalStyle.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: GlobalStyle.light_gray.withOpacity(0.1),
                            ),
                          ),
                          child: Center(
                              child: Text('여자', style: TextStyle(
                                fontSize: 16,
                                color: female ? GlobalStyle.white : GlobalStyle.light_gray,
                              ),)
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: desk ? 25 : 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              flex: 1,
                              child: TextButton(
                                child: Container(
                                  width: desk ? 100 : 160,
                                  height: desk ? 40 : 50,
                                  decoration: BoxDecoration(
                                      color: GlobalStyle.gray,
                                      borderRadius: desk ? BorderRadius.circular(3) : BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text('이전', style: TextStyle(
                                      fontSize: 14,
                                      color: GlobalStyle.white,
                                    ),),
                                  ),
                                ),
                                onPressed: () {
                                  _pageController.previousPage(
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
                                  width: desk ? 100 : 160,
                                  height: desk ? 40 : 50,
                                  decoration: BoxDecoration(
                                    color: GlobalStyle.gray,
                                    borderRadius: desk ? BorderRadius.circular(3) : BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                    child: Text('다음', style: TextStyle(
                                      fontSize: 14,
                                      color: GlobalStyle.white,
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
                  ),
              ],
            ),
            // 2nd page
            Column(
              children: [
                Container(height: desk ? 30 : 50,),
                Text('정확한 두피 면적 계산을 위해 나이대를 입력해 주세요.', style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: GlobalStyle.black,
                ),),
                Text('바야바즈 두피면적 진단은 성별과 나이대를 토대로 면적이 계산되요.', style: TextStyle(
                  fontSize: 15,
                  color: GlobalStyle.black,
                ),),
                Container(height: 30,),
                Container(
                  width: 500,
                  height: 200,
                  child: GridView(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 10,
                      childAspectRatio: desk ? 10/3 : 10/2,
                    ),
                    children: [
                      // for(var i=0; i<one.length; i++)
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              one=!one;
                              two=false;
                              three=false;
                              four=false;
                              five=false;
                              six=false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: one ? GlobalStyle.green : GlobalStyle.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: GlobalStyle.light_gray.withOpacity(0.1),
                              ),
                            ),
                            child: Center(
                              child: Text('10대',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: one ? GlobalStyle.white : GlobalStyle.light_gray,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              two=!two;
                              one=false;
                              three=false;
                              four=false;
                              five=false;
                              six=false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: two ? GlobalStyle.green : GlobalStyle.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: GlobalStyle.light_gray.withOpacity(0.1),
                              ),
                            ),
                            child: Center(
                              child: Text('20대',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: two ? GlobalStyle.white : GlobalStyle.light_gray,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              three=!three;
                              one=false;
                              two=false;
                              four=false;
                              five=false;
                              six=false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: three ? GlobalStyle.green : GlobalStyle.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: GlobalStyle.light_gray.withOpacity(0.1),
                              ),
                            ),
                            child: Center(
                              child: Text('30대',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: three ? GlobalStyle.white : GlobalStyle.light_gray,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              four=!four;
                              one=false;
                              two=false;
                              three=false;
                              five=false;
                              six=false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: four ? GlobalStyle.green : GlobalStyle.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: GlobalStyle.light_gray.withOpacity(0.1),
                              ),
                            ),
                            child: Center(
                              child: Text('40대',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: four ? GlobalStyle.white : GlobalStyle.light_gray,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              five=!five;
                              one=false;
                              two=false;
                              three=false;
                              four=false;
                              six=false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: five ? GlobalStyle.green : GlobalStyle.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: GlobalStyle.light_gray.withOpacity(0.1),
                              ),
                            ),
                            child: Center(
                              child: Text('50대',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: five ? GlobalStyle.white : GlobalStyle.light_gray,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              six=!six;
                              one=false;
                              two=false;
                              three=false;
                              four=false;
                              five=false;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: six ? GlobalStyle.green : GlobalStyle.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: GlobalStyle.light_gray.withOpacity(0.1),
                              ),
                            ),
                            child: Center(
                              child: Text('60대 이상',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: six ? GlobalStyle.white : GlobalStyle.light_gray,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: desk ? double.infinity : 600,
                  margin: EdgeInsets.only(top: desk ? 25 : 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        flex: 1,
                        child: TextButton(
                          child: Container(
                            width: desk ? 100 : 160,
                            height: desk ? 40 : 50,
                            decoration: BoxDecoration(
                              color: GlobalStyle.gray,
                              borderRadius: desk ? BorderRadius.circular(3) : BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text('이전', style: TextStyle(
                                fontSize: 14,
                                color: GlobalStyle.white,
                              ),),
                            ),
                          ),
                          onPressed: () {
                            _pageController.previousPage(
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
                            width: desk ? 100 : 160,
                            height: desk ? 40 : 50,
                            decoration: BoxDecoration(
                              color: GlobalStyle.gray,
                              borderRadius: desk ? BorderRadius.circular(3) : BorderRadius.circular(5),
                            ),
                            child: Center(
                              child: Text('다음', style: TextStyle(
                                fontSize: 14,
                                color: GlobalStyle.white,
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
            ),
            // 3rd page
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: desk ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                children: [
                  Container(height: desk ? 25 : 50,),
                  Text('AI 두피 면적 계산을 위한 사진을 등록해주세요.', style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.bold,
                    color: GlobalStyle.black,
                  ),),
                  Text('가이드에 근접할 수록 AI의 정확도가 높아져요.', style: TextStyle(
                    fontSize: 15,
                    color: GlobalStyle.black,
                  ),),
                  Container(height: 30,),
                  Image.asset('images/best.png', width: desk ? double.infinity : 500,),
                  Container(height: 30,),
                  ImgUpload(),
                  Container(
                    width: desk ? double.infinity : 600,
                    margin: EdgeInsets.only(top: desk ? 25 : 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          flex: 1,
                          child: TextButton(
                            child: Container(
                              width: desk ? 100 : 160,
                              height: desk ? 40 : 50,
                              decoration: BoxDecoration(
                                color: GlobalStyle.gray,
                                borderRadius: desk ? BorderRadius.circular(3) : BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text('이전', style: TextStyle(
                                  fontSize: 14,
                                  color: GlobalStyle.white,
                                ),),
                              ),
                            ),
                            onPressed: () {
                              _pageController.previousPage(
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
                              width: desk ? 100 : 160,
                              height: desk ? 40 : 50,
                              decoration: BoxDecoration(
                                color: GlobalStyle.gray,
                                borderRadius: desk ? BorderRadius.circular(3) : BorderRadius.circular(5),
                              ),
                              child: Center(
                                child: Text('다음', style: TextStyle(
                                  fontSize: 14,
                                  color: GlobalStyle.white,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ImgUpload extends StatefulWidget {
  const ImgUpload({Key? key}) : super(key: key);

  @override
  State<ImgUpload> createState() => ImgUploadState();
}

class ImgUploadState extends State<ImgUpload> {
  File? _pickedImage;
  Uint8List webImage = Uint8List(8);

  Future<void> _pickImage() async {
    if(!kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if(image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        print('no image');
      }
    } else if(kIsWeb) {
      final ImagePicker _picker = ImagePicker();
      XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if(image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
        });
      } else {
        print('no image');
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    var desk = ResponsiveBreakpoints.of(context).smallerThan(DESKTOP);

    return DottedBorder(
      borderType: BorderType.RRect,
      radius: Radius.circular(12),
      color: GlobalStyle.gray,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: GestureDetector(
          onTap: () {
            _pickImage();
          },
          child: Container(
            width: desk ? double.infinity : 500,
            height: 150,
            color: GlobalStyle.white,
            child: _pickedImage == null
                ? Icon(Icons.file_copy_outlined, color: GlobalStyle.gray, size: desk ? 30 : 40,)
                : kIsWeb 
                ? Image.memory(webImage, fit: BoxFit.fill,) : Image.file(_pickedImage!, fit: BoxFit.fill,)
          ),
        ),
      ),
    );
  }
}
