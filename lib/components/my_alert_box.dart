import 'package:flutter/material.dart';

class MyAlertBox extends StatelessWidget {
  final controller;
  final VoidCallback? onSave;
  final VoidCallback? onCancel;
  final String hintText;
  MyAlertBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Enter New Habit"),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: hintText),
      ),
      actions: [
        TextButton(
            onPressed: () {
              onCancel!();
              Navigator.of(context).pop();
            },
            child: Text("Cancel")),
        TextButton(
            onPressed: () {
              onSave!();
            },
            child: Text("Add"))
      ],
    );
  }
}
