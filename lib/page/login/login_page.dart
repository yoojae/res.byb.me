import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Text('로그인 페이지'),
          GestureDetector(
            onTap: () {

            },
          )
        ],
      ),
    );
  }
}
