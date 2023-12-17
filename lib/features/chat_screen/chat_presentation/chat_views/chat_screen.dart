import 'package:chatgpt_app/features/chat_screen/chat_presentation/chat_views/widget/chat_screen_body.dart';
import 'package:flutter/material.dart';

class ChatScreen  extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  const  Scaffold(
      body: ChatScreenBody(),
    );
  }
}


