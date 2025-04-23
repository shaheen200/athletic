import 'package:athletic/controller/change_theme.dart';
import 'package:athletic/main.dart';
import 'package:athletic/provider/language/ar.dart';
import 'package:athletic/provider/language/en.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_image/customImage.dart';
import 'package:athletic/tools/msg_dialog.dart';
import 'package:athletic/tools/waiting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChangeProvider>(context);
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
            TextButton(
                onPressed: () {
                  msgDialog(
                    context1: context,
                    state: 0,
                    text: getText('ch_lang'),
                    onClick: () async {
                      pOP(context);
                      await provider.changeLanguage(!provider.isEn);

                      Athletic.restartApp(context);
                    },
                  );
                },
                child: TEXT(
                    text: provider.isEn
                        ? ar['lang'].toString()
                        : en['lang'].toString(),
                    size: 17,
                    bold: true,
                    color: Theme.of(context).primaryColor)),
            SizedBox(width: MediaQuery.of(context).size.width * 0.03)
          ],
        )
      ],
    );
  }
}
