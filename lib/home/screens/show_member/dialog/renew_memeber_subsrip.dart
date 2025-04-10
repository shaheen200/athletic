import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/member_base.dart';
import 'package:athletic/database/plan_base.dart';
import 'package:athletic/models/client_models.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_dialog.dart';
import 'package:athletic/tools/fields/custom_drop_down.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:athletic/tools/msg_dialog.dart';
import 'package:athletic/tools/waiting.dart';
import 'package:athletic/validator/field_val.dart';
import 'package:flutter/material.dart';

renewMemeberPlans(BuildContext context,
    {required ApplicationController<ClientModels> controller,
    required int index}) async {
  final CustomDropDownController plans = CustomDropDownController();
  TextEditingController numberDays = TextEditingController();
  TextEditingController price = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  customDialog(
      context: context,
      width: 0.5,
      child: FutureBuilder(
        future: PlanBase.getPlanType(day: false),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snapshot.data!.success) {
            return Center(
              child: TEXT(
                text: snapshot.data!.msg,
                size: 18,
                bold: true,
                color: Colors.white,
              ),
            );
          } else {
            plans.equal(snapshot.data!.data.map(
              (e) {
                return CustomDropDownItems(
                    text: e.planName,
                    value: e.id.toString(),
                    onTap: () {
                      numberDays.text = e.durationDays.toString();
                      price.text = e.price.toString();
                    });
              },
            ).toList());
            return Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomDropDown(
                      controller: plans,
                      labelText: getText('plan'),
                      validator: (p0) {
                        return val(p0);
                      },
                      onChanged: (p0) {},
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomTextFieldByText2(
                      color: Colors.white,
                      controller: numberDays,
                      textWriteColor: Colors.black,
                      labelText: getText('count_day'),
                      enable: false,
                      validator: (p0) {
                        return val(p0);
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomTextFieldByText2(
                      color: Colors.white,
                      enable: false,
                      textWriteColor: Colors.black,
                      labelText: getText('price'),
                      validator: (p0) {
                        return val(p0);
                      },
                      type: CustomTextFieldByTextType.number,
                      controller: price,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                  ],
                ));
          }
        },
      ),
      ok: () async {
        if (formKey.currentState!.validate()) {
          waiting(context: context);
          ApiData add = await MemberBase.renew(
              membershipId: controller.items[index].id, planId: plans.value!);
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
