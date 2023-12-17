import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class CustomSmoothPageIndicator extends StatelessWidget {
  CustomSmoothPageIndicator({required this.controller,super.key,required this.count});
  PageController controller;
  int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      children:
      [
        SmoothPageIndicator(
          effect:  const ExpandingDotsEffect(
            dotColor: Colors.grey,
            dotHeight: 10,
            expansionFactor: 4,
            activeDotColor: Colors.deepOrange,
            dotWidth: 10,
            spacing: 5,

          ),
          controller: controller,
          count: count,
        ),
      ],
    );
  }
}