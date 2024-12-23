// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'container/custom_container.dart';

class CustomHeadTableItems {
  final int flex;
  final String text;
  final bool show;
  CustomHeadTableItems(
      {required this.flex, required this.text, this.show = true});
}

class CustomHeadTable extends StatelessWidget {
  final List<CustomHeadTableItems> headData;
  const CustomHeadTable({super.key, required this.headData});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      elevation: 1,
      pading: 10,
      margin: 5,
      width: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: headData.where((element) => element.show).toList().map((e) {
          return Expanded(
              flex: e.flex,
              child: Text(
                e.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColorDark,
                    fontWeight: FontWeight.bold),
              ));
        }).toList(),
      ),
    );
  }
}

class CustomBodyTableItems {
  final int flex;
  final Widget widget;
  final bool show;
  CustomBodyTableItems(
      {required this.flex, required this.widget, this.show = true});
}

class CustomBodyTable extends StatelessWidget {
  final double? padding;
  final List<CustomBodyTableItems> headData;
  const CustomBodyTable({super.key, required this.headData, this.padding = 10});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      pading: padding,
      margin: 7,
      elevation: 1,
      width: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: headData.where((element) => element.show).toList().map((e) {
          return Expanded(flex: e.flex, child: Center(child: e.widget));
        }).toList(),
      ),
    );
  }
}
