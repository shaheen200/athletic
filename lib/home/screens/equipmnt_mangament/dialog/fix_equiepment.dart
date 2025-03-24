import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/equipment_base.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/custom_dialog.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:athletic/tools/msg_dialog.dart';
import 'package:athletic/tools/waiting.dart';
import 'package:athletic/validator/field_val.dart';
import 'package:flutter/material.dart';

fixEquipmentDialog({required BuildContext context, required int id}) {
  TextEditingController price = TextEditingController();
  TextEditingController note = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  customDialog(
    context: context,
    width: 0.4,
    child: Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomTextFieldByText2(
            type: CustomTextFieldByTextType.number,
            textWriteColor: Colors.black,
            color: Colors.white,
            controller: price,
            labelText: getText('price'),
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
            controller: note,
            labelText: getText('note'),
            validator: (p0) {
              return val(p0);
            },
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    ),
    ok: () async {
      pOP(context);
      waiting(context: context);
      ApiData add = await EquipmentBase.fixEquipment(
          id: id, note: note.text, price: price.text);
      pOP(context);
      await msgDialog(
          context1: context, state: add.success ? 1 : -1, text: add.msg);
    },
  );
}
