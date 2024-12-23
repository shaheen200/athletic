import 'package:athletic/home/drawer_tile.dart';
import 'package:athletic/tools/customText.dart';
import 'package:flutter/material.dart';

import '../controller/home_page_controller.dart';

class DrawerHomePage extends StatefulWidget {
  final HomePageController controller;
  const DrawerHomePage({super.key, required this.controller});

  @override
  State<DrawerHomePage> createState() => _DrawerHomePageState();
}

class _DrawerHomePageState extends State<DrawerHomePage> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      width: MediaQuery.of(context).size.width * 0.2,
      backgroundColor: Theme.of(context).primaryColor,
      child: Padding(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.04, bottom: 6),
        child: Column(
          children: [
            const Icon(Icons.person_pin, color: Colors.white, size: 100),
            const SizedBox(height: 10),
            const TEXT(
                text: 'Administrator Name',
                size: 20,
                bold: true,
                color: Colors.white),
            const SizedBox(height: 10),
            const TEXT(
                text: 'ATHLETIC.FIT@gmail.com', size: 17, color: Colors.white),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Expanded(
              child: ListView.builder(
                itemCount: widget.controller.widgets.length,
                itemBuilder: (context, index) {
                  return DrawerTile(select: widget.controller, index: index);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
