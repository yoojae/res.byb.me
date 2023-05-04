import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../global_assets/global_style.dart';

class StartDialog extends StatelessWidget {
  const StartDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: GlobalStyle.white,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        width: double.infinity,
        height: 150,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('진단을 하려면 로그인을 해주세요.'),
              Container(height: 15,),
              Row(
                children: [
                  Flexible(
                    flex: 1,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: GlobalStyle.light_green,
                          ),
                          child: Center(
                            child: Text('취소'),
                          ),
                        ),
                      )
                  ),
                  Container(width: 10,),
                  Flexible(
                      flex: 1,
                      child: GestureDetector(
                        onTap: () => context.go('/loginpage'),
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: GlobalStyle.green,
                          ),
                          child: Center(
                            child: Text('로그인', style: TextStyle(
                              color: GlobalStyle.white,
                            ),),
                          ),
                        ),
                      )
                  ),
                ],
              ),
            ],
          )
      ),
    );
  }
}
