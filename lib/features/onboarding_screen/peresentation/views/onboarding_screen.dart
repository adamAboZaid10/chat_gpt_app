import 'package:chatgpt_app/features/onboarding_screen/peresentation/views/widgets/onboarding_screen_body.dart';
import 'package:flutter/material.dart';
import '../manager/cubit/onboarding_cubit.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
              actions:
              [
                TextButton(
                onPressed: ()
                {
                  OnboardingCubit.get(context).submit(context: context);
                },
                child:const Text('SKIP')),
          ]
          ),
        body:  const OnboardingScreenBody()
    );
  }
}
