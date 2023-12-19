import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../settings_manager/settings_cubit.dart';

class ShowDialogChangeLanguage extends StatelessWidget {
  const ShowDialogChangeLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          shape: const RoundedRectangleBorder(
            side: BorderSide.none,
          ),
          content: Column(
            children: [
               Text(
                'Chose Language'.tr(),
                style:const  TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              const SizedBox(
                height: 5,
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 5,
              ),
              MaterialButton(
                onPressed: () {
                  SettingsCubit.get(context).changeLanguageToArabic(context);
                  Navigator.pop(context);
                },
                child:  Text('Arabic'.tr()),
              ),
              MaterialButton(
                onPressed: () {
                  SettingsCubit.get(context).changeLanguageToEnglish(context);
                  Navigator.pop(context);
                },
                child:   Text('English'.tr()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}