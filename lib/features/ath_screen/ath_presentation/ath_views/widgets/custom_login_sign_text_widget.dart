
import 'package:flutter/material.dart';

class CustomWelcomeTextWidgetSignInAndLogin extends StatelessWidget {
  CustomWelcomeTextWidgetSignInAndLogin({super.key,required this.text,required this.signOrLogin});
  String text;
  String signOrLogin;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 82,),
        Row(
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,

              ),
            ),
            SizedBox(width: 6,),
            Icon(Icons.waving_hand_rounded,color: Colors.yellow,),
          ],
        ),
        const SizedBox(height: 29,),
        Text(
          signOrLogin,
          style:const  TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,

          ),
        ),
      ],
    );
  }
}

