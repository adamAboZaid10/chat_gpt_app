
import 'package:flutter/material.dart';

class CustomAppBarChatScreen extends StatelessWidget {
  const CustomAppBarChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children:
        [
          IconButton(
              onPressed: ()
              {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new,color: Colors.black,)
          ),
          const Text(
            'ChatBot AI',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
            ),
          ),
          IconButton(
              onPressed: (){},
              icon: const Icon(Icons.settings,color: Colors.black,)
          ),
        ],
      ),
    );
  }
}
