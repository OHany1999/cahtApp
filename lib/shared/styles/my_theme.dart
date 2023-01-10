// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'colors.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    primaryColor: appbarcolor,
    scaffoldBackgroundColor: lightbackground,
    colorScheme: ColorScheme(
      primary: appbarcolor,
      onPrimary: white,
      secondary: black,
      onSecondary: withoutcolor,
      error: withoutcolor,
      onError: withoutcolor,
      surface: white,
      onSurface: withoutcolor,
      background: lightbackground,
      onBackground: withoutcolor,
      brightness: Brightness.light,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      iconTheme: IconThemeData(color: white),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
      subtitle1: TextStyle(fontSize: 20, color: Colors.white),
      subtitle2: TextStyle(fontSize: 20, color: donecolor),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: appbarcolor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: white,
      selectedItemColor: appbarcolor,
      unselectedItemColor: Colors.grey.shade400,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    primaryColor: appbarcolor,
    scaffoldBackgroundColor: darkbackground,
    colorScheme: ColorScheme(
      primary: appbarcolor,
      onPrimary: grey,
      secondary: white,
      onSecondary: withoutcolor,
      error: withoutcolor,
      onError: withoutcolor,
      surface: grey,
      onSurface: withoutcolor,
      background: darkbackground,
      onBackground: withoutcolor,
      brightness: Brightness.dark,
    ),
    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: white)),
    textTheme: TextTheme(
        headline1: TextStyle(
            fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
        subtitle1: TextStyle(fontSize: 20, color: Colors.white)),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: appbarcolor,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: grey,
        selectedItemColor: appbarcolor,
        unselectedItemColor: Colors.grey.shade400,
    ),
  );
  
}
