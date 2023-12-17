import 'package:flutter/material.dart';

import 'custom_other_register_body.dart';

class CustomOrSignWith extends StatelessWidget {
  const CustomOrSignWith({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          children:
          [
            Expanded(child: Divider(thickness: 1,color: Colors.grey.shade300,)),
            const Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.0),
              child:  Text('or continue with'),
            ),
            Expanded(child: Divider(thickness: 1,color: Colors.grey.shade300,)),

          ],
        ),

        const SizedBox(height: 10,),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
          CustomOtherRegisterBody(image: 'assets/images/Google.png',onTap: (){},),
          CustomOtherRegisterBody(image: 'assets/images/facebook.png',onTap: (){},),
          CustomOtherRegisterBody(image: 'assets/images/Apple.png',onTap: (){},),
        ],),
        const SizedBox(height: 20,),
      ],
    );
  }
}



