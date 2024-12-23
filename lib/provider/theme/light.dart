import 'package:flutter/material.dart';

final ThemeData lightTheme = ThemeData(
    primaryColorLight: Colors.white,
    primaryColorDark: Colors.black,
    primaryColor: const Color(0xff1A1363),
    useMaterial3: true,
    splashColor: Colors.blue.shade200,
    scaffoldBackgroundColor: const Color(0xffECE9E9),
    fontFamily: "tajawal",
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xffECE9E9),
        foregroundColor: Colors.black,
        elevation: 0,
        scrolledUnderElevation: 0,
        titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            fontFamily: "tajawal")),
    drawerTheme: const DrawerThemeData(
        backgroundColor: Colors.white,
        elevation: 20,
        shadowColor: Colors.black));
