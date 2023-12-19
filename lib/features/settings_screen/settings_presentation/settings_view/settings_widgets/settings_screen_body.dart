import 'package:chatgpt_app/features/settings_screen/settings_presentation/settings_view/settings_widgets/show_dialog_change_language.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../ath_screen/ath_presentation/ath_views/sign_screen.dart';
import '../../settings_manager/settings_cubit.dart';
import 'custom_container_of_all_settings_features.dart';

class SettingsScreenBody extends StatelessWidget {
   const SettingsScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SettingsCubit,SettingsState> (
      builder: (context,state)
      {
        var cubit = SettingsCubit.get(context);
        return  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SingleChildScrollView(
            child: Column(
              children:
              [
                const SizedBox(height: 50,),
                Container(
                  width: double.infinity,
                  height: 60,
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
                          'chat history & training'.tr(),
                          style:  const TextStyle(fontSize: 20,fontWeight: FontWeight.w600),
                        ),
                        Switch(
                          value:cubit.light0,
                          activeTrackColor: Colors.green,
                          onChanged: (bool value) {
                            cubit.light0 = value;
                            cubit.toggleSwitch(value);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                CustomContainerOfAllFeatureSettingsScreenWidget(
                    title: 'shared links'.tr(),
                    onPressed: (){}, color: Colors.grey.shade400,
                    settingsName: 'Manage'.tr()
                ),
                CustomContainerOfAllFeatureSettingsScreenWidget(
                    title: 'Change Language'.tr(),
                    onPressed: ()
                    {
                      showDialog(
                          context: context,
                          builder: (context)=>const ShowDialogChangeLanguage(),
                      );
                    },
                    color: Colors.grey.shade400,
                    settingsName: 'change'.tr()
                ),
                CustomContainerOfAllFeatureSettingsScreenWidget(
                  title: 'Theme'.tr(),
                  onPressed: ()
                  {
                    cubit.changeThemeMode();
                  },
                  settingsName: 'system'.tr(),
                  color: Colors.grey.shade400,
              ),
                CustomContainerOfAllFeatureSettingsScreenWidget(
                    title: 'clear data'.tr(),
                    onPressed: (){},
                    settingsName: 'clear'.tr(),
                  color: Colors.red,
                ),
                CustomContainerOfAllFeatureSettingsScreenWidget(
                    title: 'Delete account'.tr(),
                    onPressed: ()
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context)=>const SignScreen())
                      );
                    },
                    settingsName: 'Delete'.tr(),
                  color: Colors.red,
                ),
                const SizedBox(height: 50,),

              ],
            ),
          ),
        );
      },
    );
  }
}



