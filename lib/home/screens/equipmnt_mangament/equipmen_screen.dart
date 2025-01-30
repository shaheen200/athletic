import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/home/screens/equipmnt_mangament/show/show_equipment.dart';
import 'package:athletic/models/equepment_models.dart';
import 'package:flutter/material.dart';

import 'add/add_equipment.dart';

class EquipmenScreen extends StatefulWidget {
  const EquipmenScreen({super.key});

  @override
  State<EquipmenScreen> createState() => _EquipmenScreenState();
}

class _EquipmenScreenState extends State<EquipmenScreen> {
  final ApplicationController<EquepmentModels> controller =
      ApplicationController<EquepmentModels>();
  @override
  void initState() {
    controller
        .addItem(EquepmentModels(id: 1, name: 'name', state: true, price: 20));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddEquipment(controller: controller),
        Expanded(
            child: ShowEquipment(
          controller: controller,
        ))
      ],
    );
  }
}
