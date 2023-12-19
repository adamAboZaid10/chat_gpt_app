

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../login_manager/cubit/login_cubit.dart';
import '../../login_manager/cubit/login_states.dart';

class ShowDialogImage extends StatelessWidget {
  const ShowDialogImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit,LoginStates>(
      builder: (context,state)
      {
        var cubit = LoginCubit.get(context);
        return Center(
          child: SingleChildScrollView(
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                side: BorderSide.none,
              ),
              content: Column(
                children: [
                   Text(
                    'Please choose an option'.tr(),
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
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
                      cubit.getCameraImage();
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.camera,
                          color: Colors.pink.shade700,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(' Camera'.tr(),
                              style: TextStyle(
                                color: Colors.pink.shade700,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      cubit.getGalleryImage();
                      Navigator.pop(context);
                    },
                    child: Row(
                      children: [
                        Icon(
                          Icons.photo,
                          color: Colors.pink.shade700,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(' Gallery'.tr(),
                              style: TextStyle(
                                color: Colors.pink.shade700,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}