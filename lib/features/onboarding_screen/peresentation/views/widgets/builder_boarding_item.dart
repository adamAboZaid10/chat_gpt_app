import 'package:flutter/material.dart';
import '../../../data/onboarding_screen_model.dart';

// ignore: must_be_immutable
class BuilderBoardingItem extends StatelessWidget {
  BuilderBoardingItem({required this.model,super.key});
  BoardingModel model;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        Expanded(
            child: Center(child: Image(image: AssetImage(model.image)))),
        const SizedBox(height: 30,),
        Center(child: Image(image: AssetImage(model.bottomImage))),
        const SizedBox(height: 15,),
        Text(
          model.title,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 25),
        ),
        const SizedBox(height: 15,),
        Text(
          model.body,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 15),
        ),
      ],
    );
  }
}