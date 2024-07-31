import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:habbit_tracker/components/habit_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Data structured for the habit list
  List toDayHabitList = [
    ["Morning Run", false],
    ["Reading a Book", false],
    ["Drink Water", false],
    ["Meditation", false],
    ["Coding", false],
    ["Evening Walk", false],
  ];
  //bool to control habbit completed
  bool habitCompleted = false;
  // CheckBox was clicked
  void checkBoxClicked(bool? value) {
    setState(() {
      habitCompleted = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: ListView(
          children: [
            // habit tiles
            HabitTile(
                habitName: 'Drink Water',
                habitIsDone: habitCompleted,
                toggleHabit: (value) => checkBoxClicked(value)),
          ],
        ));
  }
}
