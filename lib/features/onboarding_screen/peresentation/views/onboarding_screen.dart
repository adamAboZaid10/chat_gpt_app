import 'package:chatgpt_app/features/onboarding_screen/peresentation/views/widgets/onboarding_screen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/cubit/onboarding_cubit.dart';
import '../manager/cubit/onboarding_states.dart';

// class OnboardingScreen extends StatelessWidget {
//   const OnboardingScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//
//     return BlocBuilder<OnboardingCubit, OnboardingStates>(
//
//       builder: (context, state) {
//         var cubit = OnboardingCubit.get(context);
//         return Scaffold(
//           appBar: AppBar(
//               actions:
//               [
//                 TextButton(
//                 onPressed: cubit.submit(context: context),
//                 child:const Text('SKIP')),
//           ]
//           ),
//           body: const OnboardingScreenBody(),
//         );
//       },
//     );
//   }
// }

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
