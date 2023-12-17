

import 'package:flutter/material.dart';

class CustomHaveAccountOrNow extends StatelessWidget {
  CustomHaveAccountOrNow({super.key,required this.text,required this.onPressed});
  String text;
  GestureTapCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
      [
        Text(text,),
        const SizedBox(width: 10,),
        TextButton(
            onPressed: onPressed,
            child: const Text(
                'Sign Now'
            )
        ),
      ],
    );
  }
}