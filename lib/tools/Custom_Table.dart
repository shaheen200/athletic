// ignore_for_file: file_names

import 'package:flutter/material.dart';

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
    return Container(
      padding: const EdgeInsets.all(10),
      color: Colors.transparent,
      margin: const EdgeInsets.all(1),
      width: double.infinity,
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
    return Container(
      padding: EdgeInsets.all(padding!),
      color: Colors.transparent,
      margin: const EdgeInsets.all(1),
      width: double.infinity,
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
