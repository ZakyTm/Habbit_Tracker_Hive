//reference our box
import 'package:flutter/material.dart';
import 'package:habbit_tracker/datetime/date_time.dart';
import 'package:hive/hive.dart';

final _myBox = Hive.box("Habbit_Database");
// create initial default data
// when the user first time open the app it's called initial state
// if it's the first time than we have to use a method or create a new method that called
// createDefaultData() but if it's not the first time than we have to use a method
// called LoadData() to load the data from the database
// now if the user checked the box of the habit or edit it or delete it or add a new habit
// than we have to use a method called updateDatabase() to update the database

// tracking a habit is a daily sort of thing so we have to create a list of habits that the user
// wants to track daily

// load data if already exists

// update database

class HabitDatabase {
  List toDayHabitList = [];

  // CREATE DEFAULT DATA
  void createDefaultData() {
    toDayHabitList = [
      ["Drink Water", false],
      ["Read Book", false],
      ["Exercise", false],
      ["Meditate", false],
      ["Write", false],
    ];

    _myBox.put("START_DATE", todaysDateFormatted());
  }

  // LOAD DATA IF IT ALREADY EXISTS
  void loadData() {
    // we have to check if it's a new day, get habit list from database
    if (_myBox.get(todaysDateFormatted()) == null) {
      toDayHabitList = _myBox.get("CURRENT_HABIT_LIST");

      //set all habit completed to false since it's a new day
      for (int i = 0; i < toDayHabitList.length; i++) {
        toDayHabitList[i][1] = false;
      }

      //if it's not a new day, load todays list from database
    } else {
      toDayHabitList = _myBox.get(todaysDateFormatted());
    }
  }

  // UPDATE DATABASE
  void updateDatabase() {
    _myBox.put("CURRENT_HABIT_LIST", toDayHabitList);
  }
}
