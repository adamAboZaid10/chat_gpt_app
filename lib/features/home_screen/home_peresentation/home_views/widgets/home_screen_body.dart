import 'package:chatgpt_app/features/ath_screen/ath_presentation/ath_views/widgets/custom_defualt_login_and_register_button.dart';
import 'package:chatgpt_app/features/chat_screen/chat_presentation/chat_views/chat_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child:  Padding(
        padding:const EdgeInsets.symmetric(horizontal: 50.0),
        child: SingleChildScrollView(
          child: Column(
            children:
            [
              const SizedBox(height: 60,),
               Center(
                child: Text(
                    'Welcome to Chat bot AI'.tr(),
                  style:Theme.of(context)
                      .textTheme.bodyText1!.copyWith(fontSize: 36,fontWeight: FontWeight.w500),),
                ),
              const SizedBox(height: 10,),
              Lottie.asset(
                'assets/images/home_animation.json',
                width:MediaQuery.of(context).size.width ,
                height: MediaQuery.of(context).size.height*.5 ,),
              const SizedBox(height: 10,),
              CustomLoginButton(
                color: Colors.black,
                  textColor: Colors.white,
                  minWidth: double.infinity,
                  text: 'Start Chat'.tr(),
                  onPressed: ()
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder:(context)=>const ChatScreen())
                    );
                  }),
              const SizedBox(height: 60,),
            ],
          ),
        ),)
    );
  }
}