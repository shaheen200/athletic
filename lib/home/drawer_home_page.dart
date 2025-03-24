import 'package:athletic/database/local_base.dart';
import 'package:athletic/home/drawer_tile.dart';
import 'package:athletic/models/user_model.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_image/customImage.dart';
import 'package:flutter/material.dart';

import '../controller/home_page_controller.dart';

class DrawerHomePage extends StatefulWidget {
  final HomePageController controller;
  const DrawerHomePage({super.key, required this.controller});

  @override
  State<DrawerHomePage> createState() => _DrawerHomePageState();
}

class _DrawerHomePageState extends State<DrawerHomePage> {
  UserModel? userData;
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    LocalBase.getUserData().then(
      (value) {
        setState(() {
          userData = value;
        });
      },
    );
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
            const CustomImage(path: 'image/avatar.png', w: 1, h: 0.1),
            const SizedBox(height: 10),
            TEXT(
                text: userData == null ? '' : userData!.userName,
                size: 20,
                bold: true,
                color: Colors.black),
            const SizedBox(height: 10),
            TEXT(
                text: userData == null ? '' : userData!.email,
                size: 17,
                color: Colors.black),
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
