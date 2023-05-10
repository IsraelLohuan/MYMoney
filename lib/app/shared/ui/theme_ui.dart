import 'package:flutter/material.dart';

class ThemeUi {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.green,
        brightness: Brightness.light,
      ),
      primaryColorLight: Colors.green,
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        backgroundColor: Colors.green,
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white
      )
    );
  }
}