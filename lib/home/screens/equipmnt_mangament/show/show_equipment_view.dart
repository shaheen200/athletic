import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/home/screens/equipmnt_mangament/dialog/edit_equepment_dialog.dart';
import 'package:athletic/home/screens/equipmnt_mangament/dialog/fix_equiepment.dart';
import 'package:athletic/home/screens/equipmnt_mangament/dialog/show_fix_equipment_dialog.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/Custom_Table.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/pop_menu/custom_pop.dart';
import 'package:flutter/material.dart';

import '../../../../models/equepment_models.dart';

class ShowEquipmentView extends StatefulWidget {
  final ApplicationController<EquepmentModels> controller;
  const ShowEquipmentView({super.key, required this.controller});

  @override
  State<ShowEquipmentView> createState() => _ShowEquipmentViewState();
}

class _ShowEquipmentViewState extends State<ShowEquipmentView> {
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
                  text: widget.controller.items[index].state
                      ? getText('run')
                      : getText('not_run'),
                  size: 17,
                  bold: true)),
          CustomBodyTableItems(
              flex: 1,
              widget: CustomPop(items: [
                CustomPopItems(
                  text: getText('edit'),
                  onTap: () {
                    editEquipmentDialog(
                        context: context,
                        controller: widget.controller,
                        index: index);
                  },
                ),
                CustomPopItems(
                  text: getText('fix'),
                  onTap: () {
                    fixEquipmentDialog(
                        context: context,
                        id: widget.controller.items[index].id);
                  },
                ),
                CustomPopItems(
                  text: getText('show_fix'),
                  onTap: () {
                    showfixEquipmentDialog(
                        context: context,
                        id: widget.controller.items[index].id);
                  },
                ),
              ]))
        ]);
      },
    );
  }
}
