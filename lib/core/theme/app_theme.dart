import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get darktheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xff17171B),
      fontFamily: 'Quicksand',
      // colorScheme: ColorScheme.fromSeed(
      //   seedColor: Colors.blue,
      //   brightness: Brightness.light,
      // ),
      // textTheme: const TextTheme(
      //   headlineLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      //   bodyMedium: TextStyle(fontSize: 16),
      // ),
      // appBarTheme: const AppBarTheme(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   foregroundColor: Colors.black,
      // ),
    );
  }
}
