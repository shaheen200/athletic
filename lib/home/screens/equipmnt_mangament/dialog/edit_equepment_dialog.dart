import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/equipment_base.dart';
import 'package:athletic/models/equepment_models.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/custom_dialog.dart';
import 'package:athletic/tools/fields/custom_drop_down.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:athletic/tools/msg_dialog.dart';
import 'package:athletic/tools/waiting.dart';
import 'package:athletic/validator/field_val.dart';
import 'package:flutter/material.dart';

editEquipmentDialog(
    {required BuildContext context,
    required ApplicationController<EquepmentModels> controller,
    required int index}) {
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  CustomDropDownController state = CustomDropDownController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  state.equal([
    CustomDropDownItems(text: 'فعال', value: true.toString(), onTap: () {}),
    CustomDropDownItems(
        text: 'غير فعال', value: false.toString(), onTap: () {}),
  ]);
  name.text = controller.items[index].name;
  price.text = controller.items[index].price;
  state.setValue(controller.items[index].state.toString());
  customDialog(
    context: context,
    width: 0.4,
    child: Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFieldByText2(
            textWriteColor: Colors.black,
            controller: name,
            color: Colors.white,
            labelText: getText('name'),
            validator: (p0) {
              return val(p0);
            },
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextFieldByText2(
            textWriteColor: Colors.black,
            color: Colors.white,
            type: CustomTextFieldByTextType.number,
            controller: price,
            labelText: getText('price'),
            validator: (p0) {
              return val(p0);
            },
          ),
          const SizedBox(
            height: 5,
          ),
          CustomDropDown(
            onChanged: (p0) {},
            controller: state,
            labelText: getText('state'),
            validator: (p0) {
              return val(p0);
            },
          ),
        ],
      ),
    ),
    ok: () async {
      pOP(context);
      waiting(context: context);
      ApiData add = await EquipmentBase.updateEquipmentById(
        id: controller.items[index].id,
        equipmentName: name.text,
        description: price.text,
        isAvailable: bool.parse(state.value!),
      );
      pOP(context);
      await msgDialog(
          context1: context, state: add.success ? 1 : -1, text: add.msg);
      if (add.success) {
        controller.editItem(
          add.data,
          (p0, p1) {
            return p0.id == p1.id;
          },
        );
      }
    },
  );
}
