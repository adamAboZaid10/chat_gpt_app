
import 'package:chatgpt_app/core/utils/default_text_form_field.dart';
import 'package:chatgpt_app/features/home_screen/home_peresentation/home_views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_check_box.dart';
import 'custom_defualt_login_and_register_button.dart';
import 'custom_have_acount_or_no.dart';
import 'custom_login_sign_text_widget.dart';
import '../../login_manager/cubit/login_cubit.dart';
import '../../login_manager/cubit/login_states.dart';
import '../sign_screen.dart';
import 'custom_sign_with.dart';

class LoginScreenBody extends StatelessWidget {
   LoginScreenBody({super.key});

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
                        text: 'Welcome back',
                        signOrLogin: 'Please enter your email & and password to sign in'),
                    const SizedBox(height: 60,),
                     Text(
                      'Email',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14)
                    ),
                    const SizedBox(height: 5,),
                    DefaultFormField(
                      obscure: false,
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        validator: (value)
                        {
                          if(value!.isEmpty)
                          {
                            return 'email must not be empty';
                          }
                          return null;
                        },
                        hintText: 'Email',
                      suffix: Icons.email,
                    ),
                    const SizedBox(height: 50,),
                     Text(
                      'Password',
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
                    ),
                    const SizedBox(height: 5,),
                    DefaultFormField(
                      obscure: cubit.obscureText,
                      controller: passwordController,
                      type: TextInputType.visiblePassword,
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'password must not be empty';
                        }
                        return null;
                      },
                      hintText: 'password',
                      suffixPressed: ()
                      {
                          cubit.changePasswordVisibility();

                      },
                      suffix:cubit.suffix,
                    ),
                    const SizedBox(height: 10,),
                     CustomCheckBox(text: 'Remember me',),
                    const SizedBox(height: 30,),
                    CustomLoginButton(
                        text: 'Login',
                        textColor: Colors.white,
                        color: Colors.blueAccent,
                        minWidth: double.infinity,
                        onPressed: ()
                        {
                          if(formKey.currentState!.validate()){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=>const HomeScreen()),
                            );
                          }
                        }
                    ),
                    const SizedBox(height: 10,),
                    Center(
                      child: TextButton(
                          onPressed: (){},
                          child:  Text(
                              'Forget password?',
                            style: Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14),
                          ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                    CustomHaveAccountOrNow(text: 'Don’t have an account?',
                        onPressed: ()
                        {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context)=>const SignScreen()));
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











