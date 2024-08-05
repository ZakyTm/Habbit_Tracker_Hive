import 'package:flutter/material.dart';
import 'package:habbit_tracker/pages/home_page.dart';

import 'package:hive_flutter/adapters.dart';

void main() async {
// initialize hive
  await Hive.initFlutter("habbit_tracker");

  // Open the box
  await Hive.openBox("habbit_Database");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
