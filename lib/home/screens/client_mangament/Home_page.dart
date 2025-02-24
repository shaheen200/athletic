import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/start_page/login_page.dart';
import 'package:athletic/tools/custom_btn/customBtn.dart';
import 'package:athletic/tools/custom_image/customImage.dart';
import 'package:athletic/tools/funTool.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const SizedBox(width: double.infinity, height: double.infinity),
        const Center(
            child: CustomImage(path: 'image/logo.png', w: 0.6, h: 0.6)),
        Positioned(
            top: 20,
            left: 20,
            child: CustomBtn(
                textcolor: Colors.white,
                onClick: () {
                  goToPage(context, const LoginPage());
                },
                text: getText('logout')))
      ],
    );
  }
}
