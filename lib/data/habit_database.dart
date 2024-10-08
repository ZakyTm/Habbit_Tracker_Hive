//reference our box

import 'package:habbit_tracker/datetime/date_time.dart';
import 'package:hive/hive.dart';

final _myBox = Hive.box("Habit_Database");
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
  Map<DateTime, int> heatMapDataSet = {};

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
    // update todays Entry
    _myBox.put(todaysDateFormatted(),
        toDayHabitList); // update the habit list of the current day

    // update universal habit list in case in changed ( new habit, edit habit, delete habit)
    _myBox.put("CURRENT_HABIT_LIST", toDayHabitList);

    // CALCULATE HABIT COMPLETE PERCENTAGES FOR EACH DAY
    calculateHabitPercentages();

    //LOAD HEAT MAP
    loadHeatMap();
  }

  void calculateHabitPercentages() {
    int countCompleted = 0;
    for (int i = 0; i < toDayHabitList.length; i++) {
      if (toDayHabitList[i][1] == true) {
        countCompleted++;
      }
    }

    String percent = toDayHabitList.isEmpty
        ? '0.0'
        : (countCompleted / toDayHabitList.length).toStringAsFixed(1);

    //Key : "percentage_summary_yyyymmdd"
    //value : string of 1dp number between 0.0 -1.0 inclusive

    _myBox.put("PERCENTAGE_SUMMARY_${todaysDateFormatted()}", percent);
  }

  void loadHeatMap() {
    DateTime startDate = createDataTimeObject(_myBox.get("START_DATE"));

    // count the number of days to load
    int daysInBetween = DateTime.now().difference(startDate).inDays;

    // go from start date to today and add each percentage to the dataset
    // "PERCENTAGE_SUMMARY_yyyymmdd" will be the key in the dataset
    for (int i = 0; i < daysInBetween + 1; i++) {
      String yyyymmdd =
          convertDateTimeObjectToString(startDate.add(Duration(days: i)));

      double strengthAsPercent =
          double.parse(_myBox.get("PERCENTAGE_SUMMARY_$yyyymmdd") ?? "0.0");

      //split the datetime up like below so it doesn't worry about hours/mins/secs etc.

      //year
      int year = startDate.add(Duration(days: i)).year;

      //month

      int month = startDate.add(Duration(days: i)).month;

      //day
      int day = startDate.add(Duration(days: i)).day;

      final percenForEachDay = <DateTime, int>{
        DateTime(year, month, day): (10 * strengthAsPercent).toInt(),
      };

      heatMapDataSet.addEntries(percenForEachDay.entries);
      print(heatMapDataSet);
    }

    //
  }
}
