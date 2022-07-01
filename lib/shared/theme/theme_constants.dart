import 'package:flutter/material.dart';

const COLOR_PRIMARY = Colors.green;
const COLOR_ACCENT = Colors.amberAccent;
late BuildContext _context;

ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 1,
        backgroundColor: Colors.green.shade100,
        iconTheme: const IconThemeData(color: Colors.black),
        titleTextStyle: const TextStyle(color: Colors.black)),
    // brightness: Brightness.light,
    textTheme: const TextTheme(
      bodyText1: TextStyle(),
      bodyText2: TextStyle(),
    ).apply(
      bodyColor: Colors.black,
      displayColor: Colors.black,
    ),
    drawerTheme: const DrawerThemeData(backgroundColor: Colors.white),
    backgroundColor: Colors.white,
    scaffoldBackgroundColor: Colors.grey.shade100,
    primaryColor: COLOR_PRIMARY,
    floatingActionButtonTheme:
        const FloatingActionButtonThemeData(backgroundColor: COLOR_ACCENT),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
            shape: MaterialStateProperty.all<OutlinedBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0))),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.green))),
    inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1)));

ThemeData darkTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    centerTitle: true,
    elevation: 1,
    backgroundColor: Colors.black45,
  ),
  brightness: Brightness.dark,
  accentColor: Colors.white,
  drawerTheme: const DrawerThemeData(backgroundColor: Colors.black),
  backgroundColor: Colors.black26,
  switchTheme: SwitchThemeData(
    trackColor: MaterialStateProperty.all<Color>(Colors.grey),
    thumbColor: MaterialStateProperty.all<Color>(Colors.white),
  ),
  inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide.none),
      filled: true,
      fillColor: Colors.grey.withOpacity(0.1)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0)),
          shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0))),
          backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
          foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
          overlayColor: MaterialStateProperty.all<Color>(Colors.black26))),
);
