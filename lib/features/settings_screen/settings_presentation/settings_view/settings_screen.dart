import 'package:chatgpt_app/features/settings_screen/settings_presentation/settings_view/settings_widgets/settings_screen_body.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: ()
          {
            Navigator.pop(context);
          },
          icon:const  Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        title: const Text(
            'Settings',
          style: TextStyle(
            fontSize: 24
          ),
        ),
      ),
      body: SettingsScreenBody(),
    );
  }
}
