import 'package:flutter/material.dart';

class CustomOtherRegisterBody extends StatelessWidget {
  CustomOtherRegisterBody(
      {Key? key, required this.image,required this.onTap})
      : super(key: key);

  String image;
  GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Row(
            children: [
              Image.asset(image),
              const SizedBox(
                width: 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}