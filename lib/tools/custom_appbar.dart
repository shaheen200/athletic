import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_image/customImage.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomImage(path: 'image/logo.png', w: 0.1, h: 0.2),
            TEXT(
                text: '  Eagle Gym',
                size: 24,
                bold: true,
                center: true,
                color: Theme.of(context).primaryColor),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.03),
            TextButton(
                onPressed: () {},
                child: TEXT(
                    text: 'Feedback',
                    size: 17,
                    color: Theme.of(context).primaryColor)),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.notifications,
                    size: 35, color: Theme.of(context).primaryColor)),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03)
          ],
        )
      ],
    );
  }
}
