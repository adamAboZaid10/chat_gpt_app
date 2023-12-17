import 'package:flutter/material.dart';

class CustomLoginButton extends StatelessWidget {
  CustomLoginButton({super.key,this.textColor,required this.text,required this.onPressed,this.color,this.minWidth});
  String text;
  GestureTapCallback onPressed;
  Color? color= Colors.blueAccent;
  Color? textColor = Colors.white;
  double? minWidth =  double.infinity;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      onPressed: onPressed,
      minWidth: minWidth,
      child: Text(
        text,
        style:  TextStyle(color: textColor),
      ),
    );
  }
}

