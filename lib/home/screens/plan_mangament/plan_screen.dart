import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/models/plan_models.dart';
import 'package:flutter/material.dart';

import 'add_plan/add_plan_screen.dart';
import 'show_plan/Show_plan.dart';

class PlanScreen extends StatefulWidget {
  const PlanScreen({super.key});

  @override
  State<PlanScreen> createState() => _PlanScreenState();
}

class _PlanScreenState extends State<PlanScreen> {
  final ApplicationController<PlanModels> controller =
      ApplicationController<PlanModels>();
  @override
  void initState() {
    controller.addItem(PlanModels(id: 1, name: 'name', countDay: 5, price: 20));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AddPlanScreen(),
        Expanded(
            child: ShowPlan(
          controller: controller,
        ))
      ],
    );
  }
}
