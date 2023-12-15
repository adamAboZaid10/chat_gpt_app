import 'package:chatgpt_app/features/home_screen/home_peresentation/home_views/widgets/home_screen_body.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body:  HomeScreenBody()
    );
  }
}

