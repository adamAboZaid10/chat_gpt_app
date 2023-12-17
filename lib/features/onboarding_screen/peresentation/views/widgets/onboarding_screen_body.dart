import 'package:chatgpt_app/features/onboarding_screen/peresentation/manager/cubit/onboarding_cubit.dart';
import 'package:chatgpt_app/features/onboarding_screen/peresentation/manager/cubit/onboarding_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'builder_boarding_item.dart';
import 'custom_circular_progress_widget.dart';
import 'custom_smooth_page_indicator.dart';

class OnboardingScreenBody extends StatefulWidget {
  const OnboardingScreenBody({super.key});

  @override
  State<OnboardingScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<OnboardingScreenBody> {

  var boardController = PageController();

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<OnboardingCubit, OnboardingStates>(
      builder: (context, state) {
        var cubit = OnboardingCubit.get(context);
        return Padding(
          padding:  const EdgeInsets.all(30.0),
          child:  Column(
            children:
            [
              Expanded(
                child: PageView.builder(
                    onPageChanged: (int index)
                    {
                      if(index == cubit.boarding.length - 1)
                      {
                        setState(() {
                          cubit.isLast = true;
                        });
                      }
                      else{
                        setState(() {
                          cubit.isLast =false;
                        });
                      }
                    },
                    controller: boardController,
                    itemCount: cubit.boarding.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context,index)=>BuilderBoardingItem(model: cubit.boarding[index])
                ),
              ),
              const SizedBox(height: 40.0,),
              Row(
                children: [
                  CustomSmoothPageIndicator(controller: boardController, count: cubit.boarding.length),
                  const Spacer(),
                   CustomCircularProgressWidget(controller:boardController ),
                ],
              ),

            ],
          ),
        );
      },
    );
  }
}



