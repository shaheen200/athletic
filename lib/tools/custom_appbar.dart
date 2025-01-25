import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_image/customImage.dart';
import 'package:flutter/material.dart';

class Custom_appbar extends StatelessWidget {
  const Custom_appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Row(
          children: [
            CustomImage(path: 'image/logo.png', w: .2, h: .2),
            TEXT(
              text: '  ATHLETIC FIT \nGYM',
              size: 24,
              bold: true,
              center: true,
            ),
          ],
        );
  }
}