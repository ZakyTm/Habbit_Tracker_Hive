import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class HabitTile extends StatelessWidget {
  final String habitName;
  final bool habitIsDone;
  final Function(bool?)? toggleHabit;
  final Function(BuildContext)? onEdit;
  final Function(BuildContext)? onDelete;

  const HabitTile(
      {super.key,
      required this.habitName,
      required this.habitIsDone,
      required this.toggleHabit,
      required this.onEdit,
      required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Slidable(
        endActionPane: ActionPane(motion: const DrawerMotion(), children: [
          // Setting option (meaning here we are going to edite our habit)
          SlidableAction(
            onPressed: onEdit,
            backgroundColor: Colors.grey.shade800,
            icon: Icons.settings,
            borderRadius: BorderRadius.circular(12),
          ),

          // Delete option (the habit)
          SlidableAction(
            onPressed: onDelete,
            backgroundColor: Colors.red,
            icon: Icons.delete,
            borderRadius: BorderRadius.circular(12),
          ),
        ]),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.green[50], borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              // Check Box

              Checkbox(
                  value: habitIsDone,
                  onChanged: toggleHabit,
                  activeColor: Colors.green.shade700),
              // Habit Name
              Text(habitName),
            ],
          ),
        ),
      ),
    );
  }
}
