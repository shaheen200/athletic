import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/database/plan_base.dart';
import 'package:athletic/models/plan_model.dart';
import 'package:athletic/tools/customText.dart';
import 'package:flutter/material.dart';
import 'add_plan/add_plan_screen.dart';
import 'show_plan/Show_plan.dart';

class PlanScreen extends StatelessWidget {
  const PlanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ApplicationController<PlanModel> controller =
        ApplicationController<PlanModel>();
    return FutureBuilder(
      future: PlanBase.getAllPlans(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.data!.success) {
          return Center(
            child: TEXT(text: snapshot.data!.msg, size: 18, bold: true),
          );
        } else {
          controller.equal(snapshot.data!.data);
          return Column(
            children: [
              AddPlanScreen(
                controller: controller,
              ),
              Expanded(
                  child: ShowPlan(
                controller: controller,
              ))
            ],
          );
        }
      },
    );
  }
}
