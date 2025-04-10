import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/database/plan_base.dart';
import 'package:athletic/models/plan_model.dart';
import 'package:athletic/tools/customText.dart';
import 'package:flutter/material.dart';
import 'add_plan/add_plan_screen.dart';
import 'show_plan/Show_plan.dart';

enum PlanScreenType { days, month }

class PlanScreen extends StatelessWidget {
  final PlanScreenType type;
  const PlanScreen({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final ApplicationController<PlanModel> controller =
        ApplicationController<PlanModel>();
    return FutureBuilder(
      future: PlanBase.getPlanType(day: type == PlanScreenType.days),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.data!.success) {
          return Center(
            child: TEXT(
              text: snapshot.data!.msg,
              size: 18,
              bold: true,
              color: Colors.white,
            ),
          );
        } else {
          controller.equal(snapshot.data!.data);
          return Column(
            children: [
              AddPlanScreen(
                type: type,
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
