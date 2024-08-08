import 'package:flutter/material.dart';
import 'package:habbit_tracker/pages/home_page.dart';

import 'package:habbit_tracker/theme/theme_provider.dart';

import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

void main() async {
  // Initialize Hive
  await Hive.initFlutter();

  // Open the box
  await Hive.openBox("Habit_Database");

  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
