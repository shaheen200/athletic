import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/plan_base.dart';
import 'package:athletic/models/plan_model.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/custom_dialog.dart';
import 'package:athletic/tools/fields/custom_text_field_by_text.dart';
import 'package:athletic/tools/msg_dialog.dart';
import 'package:athletic/tools/waiting.dart';
import 'package:athletic/validator/field_val.dart';
import 'package:flutter/material.dart';

void editPlanDialog(BuildContext context,
    ApplicationController<PlanModel> controller, int index) {
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController countDay = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  name.text = controller.items[index].planName.toString();
  price.text = controller.items[index].price.toString();
  countDay.text = controller.items[index].durationDays.toString();
  customDialog(
    context: context,
    width: 0.4,
    child: Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFieldByText(
            controller: name,
            labelText: getText('name'),
            validator: (p0) {
              return val(p0);
            },
          ),
          CustomTextFieldByText(
            numberOnly: true,
            controller: price,
            labelText: getText('price'),
            validator: (p0) {
              return val(p0);
            },
          ),
          CustomTextFieldByText(
            numberOnly: true,
            controller: countDay,
            labelText: getText('count_day'),
            validator: (p0) {
              return val(p0);
            },
          ),
        ],
      ),
    ),
    ok: () async {
      if (formKey.currentState!.validate()) {
        waiting(context: context);
        ApiData edit = await PlanBase.updatePlanById(
            planId: controller.items[index].id,
            planName: name.text,
            durationDays: countDay.text,
            price: price.text);
        pOP(context);
        if (edit.success) {
          pOP(context);
          await msgDialog(context1: context, state: 1, text: edit.msg);
          controller.editItem(
            PlanModel.fromMap(edit.data),
            (p0, p1) {
              return p0.id == p1.id;
            },
          );
        } else {
          msgDialog(context1: context, state: -1, text: edit.msg);
        }
      }
    },
  );
}
