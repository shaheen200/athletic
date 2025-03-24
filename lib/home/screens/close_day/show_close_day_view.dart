// ignore_for_file: deprecated_member_use

import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/models/close_day_model.dart';
import 'package:athletic/tools/Custom_Table.dart';
import 'package:athletic/tools/customText.dart';
import 'package:flutter/material.dart';

class ShowCloseDayView extends StatefulWidget {
  final ApplicationController<Transaction> controller;
  const ShowCloseDayView({super.key, required this.controller});

  @override
  State<ShowCloseDayView> createState() => _ShowCloseDayViewState();
}

class _ShowCloseDayViewState extends State<ShowCloseDayView> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.controller.items.length,
      itemBuilder: (context, index) {
        return CustomBodyTable(headData: [
          CustomBodyTableItems(
              flex: 1,
              widget: TEXT(text: "${index + 1}", size: 17, bold: true)),
          CustomBodyTableItems(
              flex: 2,
              widget: TEXT(
                  text: widget.controller.items[index].transactionType,
                  size: 17,
                  bold: true)),
          CustomBodyTableItems(
              flex: 2,
              widget: TEXT(
                  text: widget.controller.items[index].amount.toString(),
                  size: 17,
                  bold: true)),
          CustomBodyTableItems(
              flex: 2,
              widget: TEXT(
                  text:
                      widget.controller.items[index].transactionDate.toString(),
                  size: 17,
                  bold: true)),
          CustomBodyTableItems(
              flex: 4,
              widget: TEXT(
                  text: widget.controller.items[index].description.toString(),
                  size: 17,
                  bold: true)),
        ]);
      },
    );
  }
}
