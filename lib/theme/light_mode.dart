import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    surface: const Color.fromARGB(
        5, 255, 255, 255), // White for container backgrounds
    primary: Color.fromARGB(184, 125, 153, 177),
    secondary: Colors.blue.shade300,
    tertiary: Colors.blue.shade100,
    inversePrimary: const Color.fromARGB(255, 158, 175, 202),
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(
        color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
    headlineSmall: TextStyle(
        color: Colors.black, fontSize: 28, fontWeight: FontWeight.bold),
  ),
  iconTheme: const IconThemeData(
    color: Color.fromARGB(255, 206, 215, 223),
  ),
);
