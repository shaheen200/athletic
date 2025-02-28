import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/home/screens/plan_mangament/dialog/edit_plan_dialog.dart';
import 'package:athletic/models/plan_models.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/Custom_Table.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/msg_dialog.dart';
import 'package:athletic/tools/pop_menu/custom_pop.dart';
import 'package:flutter/material.dart';

class ShowPlanView extends StatefulWidget {
  final ApplicationController<PlanModels> controller;
  const ShowPlanView({super.key, required this.controller});

  @override
  State<ShowPlanView> createState() => _ShowPlanViewState();
}

class _ShowPlanViewState extends State<ShowPlanView> {
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
              flex: 3,
              widget: TEXT(
                  text: widget.controller.items[index].name,
                  size: 17,
                  bold: true)),
          CustomBodyTableItems(
              flex: 2,
              widget: TEXT(
                  text: widget.controller.items[index].price.toString(),
                  size: 17,
                  bold: true)),
          CustomBodyTableItems(
              flex: 2,
              widget: TEXT(
                  text: widget.controller.items[index].countDay.toString(),
                  size: 17,
                  bold: true)),
          CustomBodyTableItems(
              flex: 1,
              widget: CustomPop(items: [
                CustomPopItems(
                  text: getText('edit'),
                  onTap: () {
                    editPlanDialog(context, widget.controller, index);
                  },
                ),
                CustomPopItems(
                  text: getText('stop'),
                  onTap: () {
                    msgDialog(
                        context1: context,
                        state: 0,
                        text: getText('stop_msg'),
                        onClick: () {
                          widget.controller.delete(index);
                        });
                  },
                )
              ]))
        ]);
      },
    );
  }
}
