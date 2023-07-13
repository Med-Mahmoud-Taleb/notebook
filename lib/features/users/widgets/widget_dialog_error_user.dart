// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:notebook/data/models/model_message_error.dart';

import 'package:notebook/features/components/custom_button.dart';

class WidgetDialogErrorUser extends StatelessWidget {
  final MessageError message;
  const WidgetDialogErrorUser({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(children: [
        Icon(Icons.warning),
        SizedBox(
          width: 3,
        ),
        Text(message.title)
      ]),
      content: Text(message.content),
      actions: [
        CustomButton(
            onpressed: () {
              Navigator.pop(context);
            },
            title: "Fermer")
      ],
    );
  }
}
