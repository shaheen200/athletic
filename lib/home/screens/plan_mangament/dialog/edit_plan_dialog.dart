import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/models/plan_models.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/custom_dialog.dart';
import 'package:athletic/tools/fields/custom_text_field_by_text.dart';
import 'package:flutter/material.dart';

void editPlanDialog(BuildContext context,
    ApplicationController<PlanModels> controller, int index) {
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController countDay = TextEditingController();
  customDialog(
    context: context,
    width: 0.4,
    child: Column(
      children: [
        CustomTextFieldByText(
          controller: name,
          labelText: getText('name'),
        ),
        CustomTextFieldByText(
          controller: price,
          labelText: getText('price'),
        ),
        CustomTextFieldByText(
          controller: countDay,
          labelText: getText('count_day'),
        ),
      ],
    ),
    ok: () {},
  );
}
