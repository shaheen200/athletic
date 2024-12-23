import 'package:flutter/material.dart';

final ThemeData dartTheme = ThemeData(
  fontFamily: "cairo",
  primaryColor: const Color.fromARGB(255, 21, 83, 134),
  primaryColorDark: Colors.white,
  primaryColorLight: Colors.black,
  splashColor: Colors.white,
  canvasColor: Colors.grey.shade700,
  scaffoldBackgroundColor: const Color(0xff3B4652),
  cardColor: const Color(0xff3B4652), // custom contanier color
  useMaterial3: true,
  drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xff3B4652),
      elevation: 20,
      shadowColor: Colors.white),
);
