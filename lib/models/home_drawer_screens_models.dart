import 'package:flutter/material.dart';

class HomeDrawerScreensModels {
  final String title;
  final IconData icons;
  final Widget widget;
  final int index;
  const HomeDrawerScreensModels(
      {required this.index,
      required this.icons,
      required this.title,
      required this.widget});
}
