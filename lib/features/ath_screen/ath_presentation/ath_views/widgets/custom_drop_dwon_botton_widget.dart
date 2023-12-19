import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../login_manager/cubit/login_cubit.dart';
import '../../login_manager/cubit/login_states.dart';

class CustomDropDownButtonWidget extends StatelessWidget {
  const  CustomDropDownButtonWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit,LoginStates>(
      builder: (context,state)
      {
        var cubit = LoginCubit.get(context);
        return  SizedBox(
          width: double.infinity,
          child: DropdownButton<String>(
            icon: const Expanded(child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.keyboard_arrow_down),
              ],
            )),
            iconSize: 24,
            elevation: 16,
            style: const TextStyle(color: Colors.pink),
            underline: Container(
              height: 2,
              color: Colors.grey.shade400,
            ),
            items: <String>['male', 'female',]
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            value: cubit.dropdownValue,
            onChanged: (String? newValue)
            {
              cubit.dropDownChange(newValue);
            },
          ),
        ) ;
      },
    );
  }
}