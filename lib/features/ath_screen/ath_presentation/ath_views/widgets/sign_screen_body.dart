import 'package:chatgpt_app/features/ath_screen/ath_presentation/ath_views/login_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/default_text_form_field.dart';
import '../../login_manager/cubit/login_cubit.dart';
import '../../login_manager/cubit/login_states.dart';
import '../complete_profile_screen.dart';
import 'custom_check_box.dart';
import 'custom_defualt_login_and_register_button.dart';
import 'custom_have_acount_or_no.dart';
import 'custom_login_sign_text_widget.dart';
import 'custom_sign_with.dart';

class SignScreenBody extends StatelessWidget {
   SignScreenBody({super.key});
   var emailController = TextEditingController();
   var passwordController = TextEditingController();
   var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<LoginCubit,LoginStates>(
      builder: (context,state)
      {
        var cubit = LoginCubit.get(context);
        return  SafeArea(
          child:  SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    CustomWelcomeTextWidgetSignInAndLogin(
                        text: 'Hello there'.tr(),
                        signOrLogin: 'Please enter you email & password to create an account'.tr()),
                    const SizedBox(height: 60,),
                     Text(
                      'Create Email'.tr(),
                      style:Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14)
                    ),
                    const SizedBox(height: 5,),
                    DefaultFormField(
                      obscure: false,
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validator: (value)
                      {
                        if(!value!.contains('@'))
                        {
                          return 'invalid email'.tr();
                        }
                        return null;
                      },
                      hintText: 'Email'.tr(),
                      suffix: Icons.email,
                    ),
                    const SizedBox(height: 50,),
                     Text(
                      'Create Password'.tr(),
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
                    ),
                    const SizedBox(height: 5,),
                    DefaultFormField(
                      obscure: cubit.obscureText,
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validator: (value)
                      {
                        if(value!.length < 6)
                        {
                          return 'password must be contains more than sex char'.tr();
                        }
                        return null;
                      },
                      hintText: 'Password'.tr(),
                      suffixPressed: ()
                      {
                        cubit.changePasswordVisibility();

                      },
                      suffix:cubit.suffix,
                    ),
                    const SizedBox(height: 10,),
                    CustomCheckBox(text: 'I agree to Chatbot_AI  Public Agreement, Terms, & Privacy Policy.'.tr(),),
                    const SizedBox(height: 30,),
                    CustomLoginButton(
                        text: 'Sign up'.tr(),
                        textColor: Colors.white,
                        color: Colors.blueAccent,
                        minWidth: double.infinity,
                        onPressed: ()
                        {
                          if(formKey.currentState!.validate())
                          {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context)=>const CompleteProfileScreen()));
                          }
                        }
                    ),
                    const SizedBox(height: 10,),
                    CustomHaveAccountOrNow(text: 'Already have an account?'.tr(),
                        onPressed: ()
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context)=>const LoginScreen()));
                        }
                    ),
                    const SizedBox(height: 10,),
                    const CustomOrSignWith(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
