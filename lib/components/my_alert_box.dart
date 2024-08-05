import 'package:flutter/material.dart';

class MyAlertBox extends StatelessWidget {
  final controller;
  final VoidCallback? onSave;
  final VoidCallback? onCancel;
  final String hintText;
  const MyAlertBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel,
      required this.hintText});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Enter New Habit"),
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
            child: const Text("Cancel")),
        TextButton(
            onPressed: () {
              onSave!();
            },
            child: const Text("Add"))
      ],
    );
  }
}
