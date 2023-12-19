import 'package:chatgpt_app/core/utils/cache_helper.dart';
import 'package:chatgpt_app/features/onboarding_screen/peresentation/manager/cubit/onboarding_cubit.dart';
import 'package:chatgpt_app/features/onboarding_screen/peresentation/views/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/styles/theme_data.dart';
import 'features/ath_screen/ath_presentation/login_manager/cubit/login_cubit.dart';
import 'features/settings_screen/settings_presentation/settings_manager/settings_cubit.dart';


void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await CacheHelper.init();
   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  bool isDark=  sharedPreferences.getBool('isDark')??false;
  runApp( MyApp(isDark: isDark,));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.isDark});
  final bool isDark;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> OnboardingCubit()),
        BlocProvider(create: (context)=> LoginCubit()),
        BlocProvider(create: (context)=> SettingsCubit()..changeThemeMode(darkMode: isDark)),

      ],
      child: BlocBuilder<SettingsCubit,SettingsState>(
        builder: (context,state)
        {
          var cubit = SettingsCubit.get(context);
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: cubit.isDark? ThemeMode.dark:ThemeMode.light,
            home: const OnboardingScreen(),
          );
        },
      ),
    );
  }
}


