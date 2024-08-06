//reference our box
import 'package:flutter/material.dart';
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
  }

  // LOAD DATA IF IT ALREADY EXISTS
  void loadData() {}

  // UPDATE DATABASE
  void updateDatabase() {
    _myBox.put("CURRENT_HABIT_LIST", toDayHabitList);
  }
}
