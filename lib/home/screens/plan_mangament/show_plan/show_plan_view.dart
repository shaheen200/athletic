import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/home/screens/plan_mangament/dialog/add_offer_dialog.dart';
import 'package:athletic/home/screens/plan_mangament/dialog/edit_plan_dialog.dart';
import 'package:athletic/models/plan_model.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/Custom_Table.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/pop_menu/custom_pop.dart';
import 'package:flutter/material.dart';

class ShowPlanView extends StatefulWidget {
  final ApplicationController<PlanModel> controller;
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
                  text: widget.controller.items[index].planName,
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
                  text: widget.controller.items[index].durationDays.toString(),
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
                  text: getText('add_offer'),
                  onTap: () {
                    addOfferDialog(
                        context, widget.controller.items[index].id.toString());
                  },
                ),
              ]))
        ]);
      },
    );
  }
}
