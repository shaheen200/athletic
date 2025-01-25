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
       Custom_appbar(),
        CustomContainer(
          width: .4,
          height: .25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                Icons.circle,
                color: Theme.of(context).primaryColor,
                size: 130,
              ),
              Column(
                
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TEXT(
                        text: 'NASSAR',
                        size: 20,
                        bold: true,
                        color: Theme.of(context).primaryColor,
                      ),
                      const TEXT(text: ',مرحباً بك', size: 20),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomContainer(
              width: .2,
              height: .3,
              child: Column(
                 children: [
                  const TEXT(
                    text: 'الأعضاء',
                    size: 22,
                    bold: true,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                  ),
                  const TEXT(text: '100', bold: true, size: 20)
                ],
              ),
            ),
            CustomContainer(
              width: .2,
              height: .3,
              child: Column(
                 children: [
                  const TEXT(
                    text: 'الأعضاء النشطين',
                    size: 22,
                    bold: true,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                  ),
                  const TEXT(text: '70', bold: true, size: 20)
                ],
              ),
            ),
            CustomContainer(
              width: .2,
              height: .3,
              child: CircularPercentIndicator(
                  radius: 50,
                  lineWidth: 8.0,
                  percent: 0.75,
                  center: const Text("75%",
                      style:   TextStyle(color: (Colors.black))),
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
        )
      ],
    );
  }
}
