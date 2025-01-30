import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

// ignore: camel_case_types
class Home_page extends StatelessWidget {
  const Home_page({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppbar(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomContainer(
              pading: 20,
              width: 0.12,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TEXT(
                    text: 'الأعضاء',
                    size: 22,
                    bold: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TEXT(text: '100', bold: true, size: 20)
                ],
              ),
            ),
            const CustomContainer(
              width: 0.12,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TEXT(
                    text: 'الأعضاء النشطين',
                    size: 22,
                    bold: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TEXT(text: '70', bold: true, size: 20)
                ],
              ),
            ),
            CustomContainer(
              width: 0.12,
              child: CircularPercentIndicator(
                  radius: 50,
                  lineWidth: 8.0,
                  percent: 0.75,
                  center: const Text("75%",
                      style: TextStyle(color: (Colors.black))),
                  linearGradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: <Color>[
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColor,
                      ]),
                  rotateLinearGradient: true,
                  circularStrokeCap: CircularStrokeCap.round),
            ),
          ],
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CustomContainer(
              pading: 20,
              width: 0.12,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TEXT(
                    text: 'الأعضاء',
                    size: 22,
                    bold: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TEXT(text: '100', bold: true, size: 20)
                ],
              ),
            ),
            const CustomContainer(
              width: 0.12,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TEXT(
                    text: 'الأعضاء النشطين',
                    size: 22,
                    bold: true,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TEXT(text: '70', bold: true, size: 20)
                ],
              ),
            ),
            CustomContainer(
              width: 0.12,
              child: CircularPercentIndicator(
                  radius: 50,
                  lineWidth: 8.0,
                  percent: 0.75,
                  center: const Text("75%",
                      style: TextStyle(color: (Colors.black))),
                  linearGradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: <Color>[
                        Theme.of(context).primaryColor,
                        Theme.of(context).primaryColor,
                      ]),
                  rotateLinearGradient: true,
                  circularStrokeCap: CircularStrokeCap.round),
            ),
          ],
        ),
      ],
    );
  }
}
