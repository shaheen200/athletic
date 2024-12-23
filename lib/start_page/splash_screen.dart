import 'dart:async';
import 'package:athletic/tools/custom_image/customImage.dart';
import 'package:flutter/material.dart';

import '../tools/funTool.dart';
import 'login_page.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    Timer(
      const Duration(seconds: 2),
      () {
        goToPage(context, const LoginPage());
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CustomImage(path: "image/logo.png", w: 0.65, h: 0.75),
      ),
    );
  }
}
