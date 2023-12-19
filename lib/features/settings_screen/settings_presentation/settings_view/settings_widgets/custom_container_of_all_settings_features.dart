
import 'package:flutter/material.dart';

class CustomContainerOfAllFeatureSettingsScreenWidget extends StatelessWidget {
  CustomContainerOfAllFeatureSettingsScreenWidget({
    super.key,
    required this.title,
    required this.onPressed,
    required this.settingsName,
    required this.color
  });
  String title;
  String settingsName;
  GestureTapCallback onPressed;
  Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 50,),
        Container(
          width: double.infinity,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.grey.shade400,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:
              [
                Text(
                  title,
                  style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                ),
                OutlinedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateColor.resolveWith((states) =>color),
                  ),
                    onPressed: onPressed,
                    child:  Text(
                      settingsName,
                      style: const TextStyle(color: Colors.black),
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}

