import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial());

  static SettingsCubit get(context) => BlocProvider.of(context);


  bool light0 = true;


  void toggleSwitch(bool value)
  {
    emit(ToggleSwitchSettings());
  }


  bool isDark = false;
  void changeThemeMode({bool? darkMode})async
  {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if(darkMode != null)
      {
        isDark = darkMode;
      }else{
      isDark = !isDark;
      sharedPreferences.setBool('isDark', isDark);
    }
    emit(ChangeAppThemeState());
  }

  void changeLanguageToArabic(BuildContext context)
  {
    if(EasyLocalization.of(context)!.locale==const Locale('en','US'))
    {
      context.locale = const  Locale('ar','EG');
    }
    emit(ChangeLanguageToArabicState());
  }
  void changeLanguageToEnglish(BuildContext context)
  {
    if(EasyLocalization.of(context)!.locale==const Locale('ar','EG'))
    {
      context.locale = const  Locale('en','US');
    }
    emit(ChangeLanguageToEnglishState());
  }
}
