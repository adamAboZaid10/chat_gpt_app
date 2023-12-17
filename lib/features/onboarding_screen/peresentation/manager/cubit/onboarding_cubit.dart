import 'package:chatgpt_app/core/constants.dart';
import 'package:chatgpt_app/core/utils/cache_helper.dart';
import 'package:chatgpt_app/features/onboarding_screen/data/onboarding_screen_model.dart';
import 'package:chatgpt_app/features/onboarding_screen/peresentation/manager/cubit/onboarding_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../ath_screen/ath_presentation/ath_views/login_screen.dart';

 class OnboardingCubit extends Cubit<OnboardingStates>
{
  OnboardingCubit(): super(InitialOnboardingState());


   static OnboardingCubit get(context) => BlocProvider.of(context); 

  bool isLast = false;

  double percent = .40;


  void checkPercents()
  {
    if(percent != 1)
    {
        percent = percent + .30;
    }
    else{
        percent = .40;
        percent = percent + .30;
    }
    emit(CheckPercentState());
  }


    List<BoardingModel> boarding = [
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
            navigateAndFinish(context, const  LoginScreen());
          }
          emit(DoneSubmitState());
    }).catchError((error)
    {
      emit(ErrorSubmitState());
      debugPrint(error.toString());
    });

}}

