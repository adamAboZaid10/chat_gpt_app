import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../login_manager/cubit/login_cubit.dart';
import '../../login_manager/cubit/login_states.dart';


class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({super.key,required this.text});
  String text;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit,LoginStates>(
      builder: (context,state)
      {
        var cubit = LoginCubit.get(context);
        return Row(
          children:
          [
            Checkbox(value: cubit.isChecked, onChanged: (value)
            {
              cubit.checkedBox(value);
            }),
            const SizedBox(width: 11,),
            Expanded(child: Text(text)),
          ],
        );
      },
    );
  }
}

