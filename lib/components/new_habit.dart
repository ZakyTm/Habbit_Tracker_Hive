import 'package:flutter/material.dart';

class EnterNewHabitBox extends StatelessWidget {
  final controller;
  final VoidCallback? onSave;
  final VoidCallback? onCancel;
  EnterNewHabitBox(
      {super.key, required this.controller, this.onSave, this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Enter New Habit"),
      content: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: "Enter Habit Name"),
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
