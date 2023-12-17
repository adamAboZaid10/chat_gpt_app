import 'package:chatgpt_app/features/ath_screen/ath_presentation/ath_views/widgets/login_screen_body.dart';
import 'package:chatgpt_app/features/ath_screen/ath_presentation/ath_views/widgets/sign_screen_body.dart';
import 'package:flutter/material.dart';

class SignScreen  extends StatelessWidget {
  const SignScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: SignScreenBody(),
    );
  }
}
