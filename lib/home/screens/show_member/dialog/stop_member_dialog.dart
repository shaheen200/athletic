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

stopMemeberDays(BuildContext context,
    {required ApplicationController<ClientModels> controller,
    required int index}) async {
  TextEditingController countDay = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  customDialog(
      context: context,
      width: 0.3,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextFieldByText2(
              color: Colors.white,
              controller: countDay,
              textWriteColor: Colors.black,
              labelText: getText('count_day'),
              validator: (p0) {
                return val(p0);
              },
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
          ApiData add = await MemberBase.stop(
            userCode: controller.items[index].userCode,
            numberOfDays: countDay.text,
          );
          pOP(context);
          if (add.success) {
            controller.delete(index);
            pOP(context);
          }
          await msgDialog(
              context1: context, state: add.success ? 1 : -1, text: add.msg);
        }
      });
}
