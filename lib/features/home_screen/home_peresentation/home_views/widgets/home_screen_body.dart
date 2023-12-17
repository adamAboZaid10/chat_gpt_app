import 'package:chatgpt_app/features/ath_screen/ath_presentation/ath_views/widgets/custom_defualt_login_and_register_button.dart';
import 'package:chatgpt_app/features/chat_screen/chat_presentation/chat_views/chat_screen.dart';
import 'package:flutter/material.dart';

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
              const Center(
                child: Text(
                    'Welcome to Chat bot AI',
                  style:TextStyle(fontWeight: FontWeight.w500,fontSize: 36),
                ),
          ),
              const SizedBox(height: 10,),
              Image.asset(
                'assets/images/image_chat_bot.png',
                width:MediaQuery.of(context).size.width ,
                height: MediaQuery.of(context).size.height*.5 ,),
              const SizedBox(height: 10,),
              CustomLoginButton(
                color: Colors.black,
                  textColor: Colors.white,
                  minWidth: double.infinity,
                  text: 'Start Chat',
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
        ),
      ),
    );
  }
}