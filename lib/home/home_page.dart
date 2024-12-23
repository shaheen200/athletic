import 'package:flutter/material.dart';

import '../controller/home_page_controller.dart';
import 'drawer_home_page.dart';
import 'screen_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomePageController controller = HomePageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          DrawerHomePage(controller: controller),
          Expanded(child: ScreenView(controller: controller))
        ],
      ),
    );
  }
}
