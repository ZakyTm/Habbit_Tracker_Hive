import 'package:flutter/material.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final bool habitIsDone;
  final Function(bool?)? toggleHabit;

  const HabitTile(
      {super.key,
      required this.habitName,
      required this.habitIsDone,
      required this.toggleHabit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            // Check Box

            Checkbox(value: habitIsDone, onChanged: toggleHabit),
            // Habit Name
            Text(habitName),
          ],
        ),
      ),
    );
  }
}
