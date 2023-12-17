
import 'package:flutter/material.dart';

import '../../../../../core/utils/default_text_form_field.dart';

class CustomEnterTextAndSendWidget extends StatelessWidget {
  CustomEnterTextAndSendWidget({super.key});
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: Row(
        children:
        [
          Expanded(
            child: DefaultFormField(
              suffix: Icons.mic,
              controller: textController,
              type: TextInputType.text,
              validator: (value){
                return null;
              },
              hintText: 'Hello! there',
              obscure: false,
            ),
          ),
          const SizedBox(width: 5,),
          MaterialButton(
              color: Colors.black,
              minWidth: 10,
              onPressed: (){},
              child: const Icon(Icons.send,color: Colors.white,size: 20,)
          ),
        ],
      ),
    );
  }
}

