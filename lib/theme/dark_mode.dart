import 'package:flutter/material.dart';

// Dark Mode Theme
ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade900, // Dark gray for container backgrounds
    primary: Colors.blue.shade700,
    secondary: Colors.blue.shade500,
    tertiary: Colors.blue.shade300,
    inversePrimary: Colors.blue.shade900,
  ),
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: Colors.black, fontSize: 18),
    headlineSmall: TextStyle(
        color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold),
  ),
  cardColor: Colors.grey.shade800,
  iconTheme: IconThemeData(
    color: Colors.tealAccent.shade200,
  ),
);
