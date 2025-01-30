// ignore_for_file: deprecated_member_use

import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/Custom_Table.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:flutter/material.dart';

import '../../../../models/equepment_models.dart';
import 'show_equipment_view.dart';

class ShowEquipment extends StatefulWidget {
  final ApplicationController<EquepmentModels> controller;
  const ShowEquipment({super.key, required this.controller});

  @override
  State<ShowEquipment> createState() => _ShowEquipmentState();
}

class _ShowEquipmentState extends State<ShowEquipment> {
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
            CustomHeadTableItems(flex: 2, text: getText('state')),
            CustomHeadTableItems(flex: 1, text: getText('more')),
          ]),
          const SizedBox(height: 10),
          Expanded(child: ShowEquipmentView(controller: widget.controller))
        ],
      ),
    );
  }
}
