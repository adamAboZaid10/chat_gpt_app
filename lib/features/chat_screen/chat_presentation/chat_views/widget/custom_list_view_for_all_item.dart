

import 'package:flutter/material.dart';

class CustomListViewForAllItems extends StatelessWidget {
  const CustomListViewForAllItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context,index)
      {
        return Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
          ),
          width: MediaQuery.of(context).size.width,
          height: 40,
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text('hi'),
          ),
        );
      },
      separatorBuilder: (context,index)=>const SizedBox(
        height: 15,
      ),
      itemCount: 10,
    );
  }
}