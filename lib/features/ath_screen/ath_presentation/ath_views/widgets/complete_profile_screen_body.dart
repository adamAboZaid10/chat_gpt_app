import 'dart:io';

import 'package:chatgpt_app/core/utils/default_text_form_field.dart';
import 'package:chatgpt_app/features/ath_screen/ath_presentation/ath_views/login_screen.dart';
import 'package:chatgpt_app/features/ath_screen/ath_presentation/ath_views/widgets/custom_defualt_login_and_register_button.dart';
import 'package:chatgpt_app/features/ath_screen/ath_presentation/ath_views/widgets/show_dialog_image.dart';
import 'package:chatgpt_app/features/ath_screen/ath_presentation/login_manager/cubit/login_cubit.dart';
import 'package:chatgpt_app/features/ath_screen/ath_presentation/login_manager/cubit/login_states.dart';
import 'package:chatgpt_app/features/home_screen/home_peresentation/home_views/home_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_drop_dwon_botton_widget.dart';

class CompleteProfileScreenBody extends StatelessWidget {
   CompleteProfileScreenBody({super.key});
var nameController = TextEditingController();
var phoneController = TextEditingController();
 var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return   BlocBuilder<LoginCubit,LoginStates>(
      builder: (context,state)
      {
        var cubit = LoginCubit.get(context);
        return SafeArea(
          child:  SingleChildScrollView(
            child: Padding(
              padding:const  EdgeInsets.symmetric(horizontal: 20.0),
              child: Form(
                key:formKey ,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:
                  [
                    const SizedBox(height: 50,),
                     Text(
                      'Complete your profile'.tr(),
                      style: Theme.of(context)
                          .textTheme.bodyText1!.copyWith(fontSize: 20,fontWeight: FontWeight.w600),),
                    const SizedBox(height: 20,),
                     Text(
                      'Please enter your details to complete your profile, don’t worry your details are private.'.tr(),
                      style:Theme.of(context).textTheme.bodyText1!.copyWith(fontSize: 14,fontWeight: FontWeight.w400) ,),
                    const SizedBox(height: 30,),
                    Center(
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, right: 10),
                            child: Container(
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: cubit.selectedImage == null
                                  ? Image.asset(
                                  'assets/images/default_profile.png')
                                  : Image.file(
                                cubit.selectedImage!,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.pink.shade700,
                              radius: 18,
                              child: IconButton(
                                  iconSize: 20,
                                  alignment: Alignment.topRight,
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          const ShowDialogImage(),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.add_a_photo,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 50,),
                     Text('Full Name'.tr(),style: Theme.of(context)
                         .textTheme.bodyText1!.copyWith(fontSize: 14,fontWeight: FontWeight.w600),),
                    const SizedBox(height: 5,),
                    DefaultFormField(
                        controller: nameController,
                        type: TextInputType.text,
                        validator: (value)
                        {
                          if(value!.isEmpty)
                          {
                            return 'name must not be empty'.tr();
                          }
                          return null;
                        },
                        hintText: 'Adam Mohamed'.tr(),
                        obscure: false,
                    ),
                    const SizedBox(height: 40,),
                     Text(
                      'Phone Number'.tr(),style: Theme.of(context)
                         .textTheme.bodyText1!.copyWith(fontSize: 14,fontWeight: FontWeight.w600),),
                    const SizedBox(height: 5,),
                    DefaultFormField(
                        controller: phoneController,
                        type: TextInputType.phone,
                        suffix: Icons.phone,
                        validator: (value)
                        {
                          if(value!.isEmpty)
                          {
                            return 'phone must not be empty'.tr();
                          }
                          return null;
                        },
                        hintText: '01021879225',
                        obscure: false,
                    ),
                    const SizedBox(height: 40,),
                     Text(
                      'Gender'.tr(),style: Theme.of(context)
                         .textTheme.bodyText1!.copyWith(fontSize: 14,fontWeight: FontWeight.w600),),
                    const SizedBox(height: 5,),
                    const CustomDropDownButtonWidget(),
                    const SizedBox(height: 60,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:
                      [
                        CustomLoginButton(
                            text: 'Skip'.tr(),
                            textColor: Colors.black,
                            onPressed: ()
                            {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context)=>const HomeScreen()));
                            },
                          color: Colors.grey,
                          minWidth: 50,
                        ),
                        CustomLoginButton(
                            text: 'Sign up'.tr(),
                            onPressed: ()
                            {
                              if(formKey.currentState!.validate())
                              {

                              }
                            },
                          textColor: Colors.white,
                          color: Colors.black,
                          minWidth: 50,
                        ),
                      ],
                    ),
                    const SizedBox(height: 40,)
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






