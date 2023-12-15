import 'package:chatgpt_app/features/onboarding_screen/peresentation/manager/cubit/onboarding_cubit.dart';
import 'package:chatgpt_app/features/onboarding_screen/peresentation/manager/cubit/onboarding_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'builder_boarding_item.dart';
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
                  // FloatingActionButton(
                  //   onPressed: ()
                  //   {
                  //     if(cubit.isLast )
                  //     {
                  //       cubit.submit(context: context);
                  //     }else{
                  //       boardController.nextPage(
                  //         duration: const Duration(
                  //           milliseconds: 750,
                  //         ),
                  //         curve: Curves.fastEaseInToSlowEaseOut,
                  //       );
                  //     }
                  //   },
                  //   child:const Icon(Icons.arrow_forward_ios) ,),
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


class CustomCircularProgressWidget extends StatefulWidget {
   CustomCircularProgressWidget({super.key,required this.controller});
PageController controller;

  @override
  State<CustomCircularProgressWidget> createState() => _CustomCircularProgressWidgetState();
}

class _CustomCircularProgressWidgetState extends State<CustomCircularProgressWidget> {

double percent = .40;

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
            percent: percent,

            center:  CircleAvatar(
              radius: 20,
              child:  IconButton(onPressed: ()
              {
                if(cubit.isLast )
                {
                  cubit.submit(context: context);
                }else{
                  widget.controller.nextPage(
                    duration: const Duration(
                      milliseconds: 750,
                    ),
                    curve: Curves.fastEaseInToSlowEaseOut,
                  );

                    if(percent != 1)
                    {
                     setState(() {
                       percent = percent + .30;
                     });
                    }
                    else{
                      setState(() {
                        percent = .40;
                        percent = percent + .30;
                      });
                    }


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




