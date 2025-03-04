import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/database/equipment_base.dart';
import 'package:athletic/home/screens/equipmnt_mangament/show/show_equipment.dart';
import 'package:athletic/models/equepment_models.dart';
import 'package:athletic/tools/customText.dart';
import 'package:flutter/material.dart';

import 'add/add_equipment.dart';

class EquipmenScreen extends StatelessWidget {
  const EquipmenScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ApplicationController<EquepmentModels> controller =
        ApplicationController<EquepmentModels>();

    return FutureBuilder(
      future: EquipmentBase.getAllEquipment(),
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
              AddEquipment(controller: controller),
              Expanded(
                  child: ShowEquipment(
                controller: controller,
              ))
            ],
          );
        }
      },
    );
  }
}
