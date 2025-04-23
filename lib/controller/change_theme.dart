import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeProvider extends ChangeNotifier {
  static bool darkMode = false;
  static bool language = false;
  bool isDark = darkMode;
  bool isEn = language;

  Future<void> changeTheme(bool value) async {
    darkMode = value;
    isDark = value;
    await setTheme(isDark);
    notifyListeners();
  }

  Future<void> changeLanguage(bool value) async {
    language = value;
    isEn = value;
    await setLanguage(isEn);
    notifyListeners();
  }

  void setValue(bool isDark, bool isEn) {
    this.isDark = isDark;
    this.isEn = isEn;
  }
}

Future<void> getProviderValue() async {
  SharedPreferences sp = await SharedPreferences.getInstance();

  ChangeProvider.darkMode = sp.getBool('isDark') ?? false;
  ChangeProvider.language = sp.getBool('isEn') ?? false;
}

Future<void> setTheme(bool isDark) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  sp.setBool("isDark", isDark);
}

Future<void> setLanguage(bool isEn) async {
  SharedPreferences sp = await SharedPreferences.getInstance();
  sp.setBool("isEn", isEn);
}
