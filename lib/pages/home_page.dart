import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:habbit_tracker/components/habit_tile.dart';
import 'package:habbit_tracker/components/my_fab.dart';
import 'package:habbit_tracker/components/new_habit.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // [Data structured for the habit list],
  List toDayHabitList = [
    ["Morning Run", false],
    ["Reading a Book", false],
    ["Drink Water", false],
    ["Meditation", false],
    ["Coding", false],
    ["Evening Walk", false],
  ];

  // CheckBox was clicked
  void checkBoxClicked(bool? value, int index) {
    setState(() {
      toDayHabitList[index][1] = value;
    });
  }

  final _newHabitNameController = TextEditingController();
  void createNewHabit() {
    setState(() {
      //Show alerts dialoge for use to create a fill in the new habbit
      showDialog(
          context: context,
          builder: (context) {
            return EnterNewHabitBox(
              controller:
                  _newHabitNameController, //controller for the text field
              onSave: saveNewHabit, //onSave function
              onCancel: cancelNewHabit, //onCancel function
            );
          });
    });
  }

  void saveNewHabit() {
    //add a new habit to todayHabitList
    setState(() {
      toDayHabitList.add([_newHabitNameController.text, false]);
    });
    //clear textField
    _newHabitNameController.clear();
    //pop dialog box
    Navigator.of(context).pop();
  }

  void cancelNewHabit() {
    //clear textField
    _newHabitNameController.clear();
    //pop dialog box
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButton: MyFloatingActionButton(
          onPressed: createNewHabit,
        ),
        body: ListView.builder(
            itemCount: toDayHabitList.length,
            itemBuilder: (context, index) {
              return HabitTile(
                  habitName: toDayHabitList[index][0],
                  habitIsDone: toDayHabitList[index][1],
                  toggleHabit: (value) => checkBoxClicked(value, index));
            }));
  }
}
