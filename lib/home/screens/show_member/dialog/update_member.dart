import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/member_base.dart';
import 'package:athletic/models/client_models.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/custom_dialog.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:athletic/tools/msg_dialog.dart';
import 'package:athletic/tools/waiting.dart';
import 'package:athletic/validator/field_val.dart';
import 'package:flutter/material.dart';

editMemeberDays(BuildContext context,
    {required ApplicationController<ClientModels> controller,
    required int index}) async {
  TextEditingController name =
      TextEditingController(text: controller.items[index].userName);
  TextEditingController email =
      TextEditingController(text: controller.items[index].userEmail);

  TextEditingController phone =
      TextEditingController(text: controller.items[index].phoneNumber);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  customDialog(
      context: context,
      width: 0.5,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextFieldByText2(
              controller: name,
              textWriteColor: Colors.black,
              labelText: getText('subscrip_name'),
              validator: (p0) {
                return val(p0);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CustomTextFieldByText2(
              textWriteColor: Colors.black,
              labelText: getText('phone'),
              validator: (p0) {
                return val(p0);
              },
              type: CustomTextFieldByTextType.number,
              controller: phone,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            CustomTextFieldByText2(
              textWriteColor: Colors.black,
              labelText: getText('email'),
              validator: (p0) {
                return val(p0);
              },
              controller: email,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
          ],
        ),
      ),
      ok: () async {
        if (formKey.currentState!.validate()) {
          waiting(context: context);
          ApiData add = await MemberBase.update(
            id: controller.items[index].id,
            email: email.text,
            phone: phone.text,
            name: name.text,
          );
          pOP(context);
          if (add.success) {
            controller.editItem(
              add.data,
              (p0, p1) {
                return p0.id == p1.id;
              },
            );
            pOP(context);
          }
          await msgDialog(
              context1: context, state: add.success ? 1 : -1, text: add.msg);
        }
      });
}
