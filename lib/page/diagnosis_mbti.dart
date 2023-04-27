

import 'package:flutter/material.dart';
import 'package:res_byb_me/global_assets/global_style.dart';
import 'package:res_byb_me/services/api_service.dart';

import '../models/mbti_model.dart';
import '../widgets/mbti_question.dart';

class DiagnosisMbti extends StatefulWidget {
  DiagnosisMbti({Key? key}) : super(key: key);


  @override
  State<DiagnosisMbti> createState() => _DiagnosisMbtiState();
}

class _DiagnosisMbtiState extends State<DiagnosisMbti> {

  List<Datum> _datum = <Datum>[];
  bool loading = false;



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
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_rounded, color: GlobalStyle.white,),
        elevation: 0,
        backgroundColor: GlobalStyle.green,
        title: Text('두피 MBTI 진단', style: TextStyle(
          color: GlobalStyle.white,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: PageView.builder(
        itemCount: _datum.length,
        itemBuilder: (context, index) {
          Datum datum = _datum[index];
          return Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: GlobalStyle.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(
                  offset: Offset(0,2),
                  color: GlobalStyle.background_gray,
                  blurRadius: 0.5,
                )]
            ),
            child: Text('Q.${datum.question}', style: TextStyle(
              fontWeight: FontWeight.bold,
              color: GlobalStyle.black,
              fontSize: 20,
            ),),
          );
        },
      ),
    );
  }
}
