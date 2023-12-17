import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  bool obscureText = true;
  IconData suffix = Icons.visibility_outlined;

  void changePasswordVisibility() {
    obscureText = !obscureText;
    suffix =
    obscureText ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(ChangePasswordVisibility());
  }


  bool? isChecked = true;
  void checkedBox(bool? value)
  {
    isChecked = value;
    emit(IsCheckedBoxState());
  }



  File? selectedImage;
  final picker = ImagePicker();
  Future<void> getCameraImage() async {
     await picker.pickImage(
      source: ImageSource.camera,
    ).then((value){
       if (value != null) {
         selectedImage = File(value.path);
         emit(SelectedImageSuccessState());
       }
    }).catchError((error)
    {
      emit(SelectedImageSuccessState());
    });

  }
  Future<void> getGalleryImage() async {
     await picker.pickImage(
      source: ImageSource.gallery,
    ).then((value){
       if (value != null) {
         selectedImage = File(value.path);
         emit(SelectedImageSuccessState());
       }
    }).catchError((error){
      debugPrint(error.toString());
      emit(SelectedImageErrorState());
    });
  }


  String dropdownValue = 'male';

  void dropDownChange(String? newValue)
  {
    dropdownValue = newValue!;
    emit(DropDownChangeState());
  }
}