// ignore_for_file: deprecated_member_use

import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/home/screens/plan_mangament/show_plan/show_plan_view.dart';
import 'package:athletic/models/plan_models.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/Custom_Table.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:flutter/material.dart';

class ShowPlan extends StatefulWidget {
  final ApplicationController<PlanModels> controller;
  const ShowPlan({super.key, required this.controller});

  @override
  State<ShowPlan> createState() => _ShowPlanState();
}

class _ShowPlanState extends State<ShowPlan> {
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: 1,
      pading: 20,
      color: Theme.of(context).primaryColor.withOpacity(0.5),
      child: Column(
        children: [
          CustomHeadTable(headData: [
            CustomHeadTableItems(flex: 1, text: getText('num')),
            CustomHeadTableItems(flex: 3, text: getText('name')),
            CustomHeadTableItems(flex: 2, text: getText('price')),
            CustomHeadTableItems(flex: 2, text: getText('count_day')),
            CustomHeadTableItems(flex: 1, text: getText('more')),
          ]),
          const SizedBox(height: 10),
          Expanded(child: ShowPlanView(controller: widget.controller))
        ],
      ),
    );
  }
}
