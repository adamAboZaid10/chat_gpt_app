

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
        Text(text,style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14,fontWeight: FontWeight.normal),),
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