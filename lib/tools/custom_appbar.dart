import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_image/customImage.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        CustomImage(path: 'image/logo.png', w: 0.1, h: 0.2),
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
