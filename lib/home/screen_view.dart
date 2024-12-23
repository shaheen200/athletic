import 'package:flutter/material.dart';

import '../controller/home_page_controller.dart';

class ScreenView extends StatefulWidget {
  final HomePageController controller;
  const ScreenView({super.key, required this.controller});

  @override
  State<ScreenView> createState() => _ScreenViewState();
}

class _ScreenViewState extends State<ScreenView> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.controller.currentSelect.widget;
  }
}
