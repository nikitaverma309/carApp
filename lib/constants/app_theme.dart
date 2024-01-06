import 'package:flutter/material.dart';

class AppTheme {
  static Color lightPrimaryColor = Colors.black;
  static Color lightSecondaryBgColor = Color(0xffF7F7F7);
  static ThemeData lightTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      primaryColor: lightPrimaryColor,
      scaffoldBackgroundColor: lightSecondaryBgColor,
      appBarTheme: AppBarTheme(backgroundColor: lightSecondaryBgColor),
      useMaterial3: true,
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: lightPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(28)),
              minimumSize: Size(50, 48),
              foregroundColor: Colors.white)),
      textTheme: TextTheme(labelMedium: TextStyle(color: Colors.black)));

  static ThemeData darkTheme = ThemeData.dark(
    useMaterial3: true,
  ).copyWith(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      primaryColor: Colors.blue.shade800,
      textTheme: TextTheme(labelMedium: TextStyle(color: Colors.white)));
}
