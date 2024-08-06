import 'package:flutter/material.dart';
import 'package:habbit_tracker/components/habit_tile.dart';
import 'package:habbit_tracker/components/my_alert_box.dart';
import 'package:habbit_tracker/components/my_fab.dart';
import 'package:habbit_tracker/data/habit_database.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:habbit_tracker/data/habit_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // [Data structured for the habit list],
  // [Habit Name, isHabitDone]
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");

  @override
  void initState() {
    // if there is no current habit list, then it is the first time ever opening the app
    // then create default data
    if (_myBox.get("CURRENT_HABIT_LIST") == null) {
      db.createDefaultData();

      // there already exists data, this is not the first time
    } else {
      db.loadData();
    }
    super.initState();
  }

  // CheckBox was clicked
  void checkBoxClicked(bool? value, int index) {
    setState(() {
      db.toDayHabitList[index][1] = value;
    });
  }

  final _newHabitNameController = TextEditingController();

  void saveNewHabit() {
    //add a new habit to todayHabitList
    setState(() {
      db.toDayHabitList.add([_newHabitNameController.text, false]);
    });
    //clear textField
    _newHabitNameController.clear();
    //pop dialog box
    Navigator.of(context).pop();
  }

  void cancelDialogBox() {
    print('Cancel button clicked');
    _newHabitNameController.clear();
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    } else {
      print('Cannot pop the context');
    }
  }

  void createNewHabit() {
    setState(() {
      //Show alerts dialoge for use to create a fill in the new habbit
      showDialog(
          context: context,
          builder: (context) {
            return MyAlertBox(
              controller:
                  _newHabitNameController, //controller for the text field
              hintText: "Enter New Habit", //hint text
              onSave: saveNewHabit, //onSave function
              onCancel: cancelDialogBox, //onCancel function
            );
          });
    });
  }

// save existing habit with a new name
  void saveExistingHabit(int index) {
    setState(() {
      db.toDayHabitList[index][0] = _newHabitNameController.text;
      _newHabitNameController.clear();
      Navigator.of(context).pop();
    });
  }

//OPen habit settings to edit
  void openHabitSettings(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertBox(
            controller: _newHabitNameController,
            onSave: () => saveExistingHabit(index),
            onCancel: cancelDialogBox,
            hintText: db.toDayHabitList[index][0],
          );
        });
  }

// Delete habit
  void deleteHabit(int index) {
    setState(() {
      db.toDayHabitList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        floatingActionButton: MyFloatingActionButton(
          onPressed: createNewHabit,
        ),
        body: ListView.builder(
            itemCount: db.toDayHabitList.length,
            itemBuilder: (context, index) {
              return HabitTile(
                habitName: db.toDayHabitList[index][0],
                habitIsDone: db.toDayHabitList[index][1],
                toggleHabit: (value) => checkBoxClicked(value, index),
                onEdit: (context) => openHabitSettings(index),
                onDelete: (context) => deleteHabit(index),
              );
            }));
  }
}
