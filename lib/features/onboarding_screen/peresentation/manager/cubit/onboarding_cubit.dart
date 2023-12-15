import 'package:chatgpt_app/core/constants.dart';
import 'package:chatgpt_app/core/utils/cache_helper.dart';
import 'package:chatgpt_app/features/home_screen/home_peresentation/home_views/home_screen.dart';
import 'package:chatgpt_app/features/onboarding_screen/data/onboarding_screen_model.dart';
import 'package:chatgpt_app/features/onboarding_screen/peresentation/manager/cubit/onboarding_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 class OnboardingCubit extends Cubit<OnboardingStates>
{
  OnboardingCubit(): super(InitialOnboardingState());


   static OnboardingCubit get(context) => BlocProvider.of(context); 

  bool isLast = false;


    List<BoardingModel> boarding =
  [
    BoardingModel(
        image: 'assets/images/one.png',
        bottomImage: 'assets/images/bottum_image.png',
        title: 'Introduction to Chatbot_AI',
        body: 'Meet Chatbot, your personal AI language model & discover the benefits of using Chatbot_AI for language tasks',
    ),
    BoardingModel(
        image: 'assets/images/two.png',
        bottomImage: 'assets/images/bottum_image.png',
        title: 'Explore categories of all topics',
        body: 'Ask question to chatbot_AI with help of different categories and get answer that you want.',
    ),
    BoardingModel(
        image: 'assets/images/third.png',
        bottomImage: 'assets/images/bottum_image.png',
        title: 'Getting started with chatbot_AI',
        body: 'Try out different language tasks and modes. ',
    ),
  ];

   submit({required  context}){
    CacheHelper.saveData(key: 'onBoarding', value: true)
        .then((value) {
          if(value == true)
          {
            navigateAndFinish(context, const  HomeScreen());
          }
          emit(DoneSubmitState());
    }).catchError((error)
    {
      emit(ErrorSubmitState());
      debugPrint(error.toString());
    });

}}

