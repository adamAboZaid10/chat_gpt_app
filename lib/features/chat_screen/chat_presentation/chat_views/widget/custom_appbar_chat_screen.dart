
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../settings_screen/settings_presentation/settings_view/settings_screen.dart';

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
              icon:  Icon(
                Icons.arrow_back_ios_new,
                color: Theme.of(context).iconTheme.color,
              ),
          ),
           Text(
            'ChatBot AI'.tr(),
            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 24,fontWeight: FontWeight.w500),
          ),
          IconButton(
              onPressed: ()
              {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder:(context)=>const SettingsScreen() ),
                );
              },
              icon:  Icon(Icons.settings,color:Theme.of(context).iconTheme.color,)
          ),
        ],
      ),
    );
  }
}
