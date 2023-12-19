
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
              style:Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 20)
            ),
            const SizedBox(width: 6,),
            const Icon(Icons.waving_hand_rounded,color: Colors.yellow,),
          ],
        ),
        const SizedBox(height: 29,),
        Text(
          signOrLogin,
          style:Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14)
        ),
      ],
    );
  }
}

