import 'package:flutter/material.dart';

ThemeData darkTheme() {
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.black,
    accentColor: Colors.orange,
    appBarTheme: AppBarTheme(color: Colors.grey),
    scaffoldBackgroundColor: Colors.grey[800],
    iconTheme: IconThemeData(color: Colors.white),
    hintColor: Colors.orange,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.white70),
    textTheme: TextTheme(
      headline4: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
      headline5: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w200),
    ),
  );
}

ThemeData lightTheme() {
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.purple,
    accentColor: Colors.orange,
    appBarTheme: AppBarTheme(color: Colors.deepPurple),
    scaffoldBackgroundColor: Colors.white,
    iconTheme: IconThemeData(color: Colors.white),
    hintColor: Colors.orange,
    floatingActionButtonTheme:
        FloatingActionButtonThemeData(backgroundColor: Colors.orange),
    textTheme: TextTheme(
      headline4: TextStyle(fontSize: 23.0, fontWeight: FontWeight.bold),
      headline5: TextStyle(fontSize: 23.0, fontWeight: FontWeight.w200),
    ),
  );
}
