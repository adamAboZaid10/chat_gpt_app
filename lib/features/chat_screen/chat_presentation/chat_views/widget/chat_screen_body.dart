import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'custom_appbar_chat_screen.dart';
import 'custom_enter_text_and_send_widget.dart';
import 'custom_list_view_for_all_item.dart';

class ChatScreenBody extends StatelessWidget {
    const ChatScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Padding(
        padding:const  EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children:
            [
              const SizedBox(height: 30,),
              const CustomAppBarChatScreen(),
              SizedBox(
                height: 200,
                child: Lottie.asset(
                  'assets/images/home_animation.json',
                  width:MediaQuery.of(context).size.width ,
                  height: MediaQuery.of(context).size.height*.4,),
              ),
              const CustomListViewForAllItems(),
              CustomEnterTextAndSendWidget(),
            ],
          ),
        ),
      ),
    );
  }
}





