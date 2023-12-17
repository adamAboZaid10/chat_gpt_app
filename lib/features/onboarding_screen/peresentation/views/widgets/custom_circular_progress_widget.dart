
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../manager/cubit/onboarding_cubit.dart';
import '../../manager/cubit/onboarding_states.dart';

// ignore: must_be_immutable
class CustomCircularProgressWidget extends StatelessWidget {
  CustomCircularProgressWidget({super.key,required this.controller});
  PageController controller;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingCubit,OnboardingStates>(
      builder: (BuildContext context, state)
      {
        var cubit = OnboardingCubit.get(context);
        return CircularPercentIndicator(
            startAngle: 180,
            backgroundColor: Colors.deepOrange,
            progressColor: Colors.grey[800],
            radius: 30,
            animation: true,
            lineWidth: 7.0,
            percent: cubit.percent,

            center:  CircleAvatar(
              radius: 20,
              child:  IconButton(onPressed: ()
              {
                if(cubit.isLast )
                {
                  cubit.submit(context: context);
                }else{
                  controller.nextPage(
                    duration: const Duration(
                      milliseconds: 750,
                    ),
                    curve: Curves.fastEaseInToSlowEaseOut,
                  );
                 cubit.checkPercents();
                }
              },
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.black,
                  )),
            ));
      },
    );
  }
}


