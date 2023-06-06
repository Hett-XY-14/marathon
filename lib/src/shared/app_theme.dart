import 'package:flutter/material.dart';

var appTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  appBarTheme: const AppBarTheme(
    color: Colors.white,
    iconTheme: IconThemeData(color: Colors.black),
    toolbarTextStyle: TextStyle(color: Colors.black, fontSize: 20),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
    foregroundColor: Colors.deepOrangeAccent,
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.deepOrangeAccent,
      side: const BorderSide(color: Colors.deepOrangeAccent),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.deepOrangeAccent,
      foregroundColor: Colors.white,
    ),
  ),
  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.black),
    bodyMedium: TextStyle(color: Colors.black),
  ),
  colorScheme: ColorScheme.fromSwatch(
    primarySwatch: const MaterialColor(
      0xFFFA8072,
      {
        50: Color.fromRGBO(250, 128, 114, .1),
        100: Color.fromRGBO(250, 128, 114, .2),
        200: Color.fromRGBO(250, 128, 114, .3),
        300: Color.fromRGBO(250, 128, 114, .4),
        400: Color.fromRGBO(250, 128, 114, .5),
        500: Color.fromRGBO(250, 128, 114, .6),
        600: Color.fromRGBO(250, 128, 114, .7),
        700: Color.fromRGBO(250, 128, 114, .8),
        800: Color.fromRGBO(250, 128, 114, .9),
        900: Color.fromRGBO(250, 128, 114, 1),
      },
    ),
    brightness: Brightness.light,
    accentColor: Colors.deepOrangeAccent,
  ),
);
