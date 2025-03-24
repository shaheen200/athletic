// ignore_for_file: deprecated_member_use

import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/home/screens/time_work/show/show_time_work_view.dart';
import 'package:athletic/models/time_work_model.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/Custom_Table.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:flutter/material.dart';

class ShowTimeWork extends StatefulWidget {
  final ApplicationController<TimeWorkModel> controller;
  const ShowTimeWork({super.key, required this.controller});

  @override
  State<ShowTimeWork> createState() => _ShowTimeWorkState();
}

class _ShowTimeWorkState extends State<ShowTimeWork> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: 1,
      margin: 20,
      pading: 20,
      color: const Color(0xffEFCF8B),
      child: Column(
        children: [
          CustomHeadTable(headData: [
            CustomHeadTableItems(flex: 1, text: getText('num')),
            CustomHeadTableItems(flex: 2, text: getText('name')),
            CustomHeadTableItems(flex: 2, text: getText('day')),
            CustomHeadTableItems(flex: 2, text: getText('start_time')),
            CustomHeadTableItems(flex: 2, text: getText('end_time')),
            CustomHeadTableItems(flex: 1, text: getText('more')),
          ]),
          const SizedBox(height: 10),
          Expanded(child: ShowTimeWorkView(controller: widget.controller))
        ],
      ),
    );
  }
}
