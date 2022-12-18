import 'package:flutter/material.dart';

final themeData = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
    ),
    shadowColor: Colors.transparent,
    shape: Border(
      bottom: BorderSide(
        color: Colors.black,
        width: 5,
      ),
    ),
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.white,
    textTheme: ButtonTextTheme.primary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      side: BorderSide(
        color: Colors.black,
        width: 2,
      ),
    ),
    splashColor: Colors.black,
    highlightColor: Colors.black,
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.black,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
    selectedIconTheme: IconThemeData(
      color: Colors.black,
    ),
    unselectedIconTheme: IconThemeData(
      color: Colors.black,
    ),
    selectedLabelStyle: TextStyle(
      color: Colors.black,
      fontSize: 18,
    ),
    unselectedLabelStyle: TextStyle(
      color: Colors.black,
      fontSize: 18,
    ),
    backgroundColor: Colors.white,
    elevation: 0,
  ),
  cardTheme: const CardTheme(
    color: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10),
      ),
      side: BorderSide(
        color: Colors.black,
        width: 2,
      ),
    ),
  ),
  splashFactory: NoSplash.splashFactory,
  focusColor: Colors.black,
);
