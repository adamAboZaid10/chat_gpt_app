import 'package:chatgpt_app/core/utils/cache_helper.dart';
import 'package:chatgpt_app/features/onboarding_screen/peresentation/manager/cubit/onboarding_cubit.dart';
import 'package:chatgpt_app/features/onboarding_screen/peresentation/views/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
   WidgetsFlutterBinding.ensureInitialized();
   await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> OnboardingCubit()),

      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const OnboardingScreen(),
      ),
    );
  }
}
