import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:res_byb_me/models/mbti_model_question.dart';


class ApiService {
  static const String url = 'https://bayabas.kr/diagnosis/item/5';

  static Future<List<Datum>> getMbti() async {
    try{
      final response = await http.get(Uri.parse(url));
      if(response.statusCode == 200) {
        final List<Datum> datum = datumListFromJson(response.body).data;
        return datum;
      } else {
        Fluttertoast.showToast(msg: 'Error occurred. Please try again');
        return <Datum>[];
      }
    } catch(e) {
      Fluttertoast.showToast(msg: e.toString());
      return <Datum>[];
    }
  }

}

