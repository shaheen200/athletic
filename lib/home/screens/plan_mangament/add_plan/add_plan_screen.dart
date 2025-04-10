// ignore_for_file: deprecated_member_use

import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/plan_base.dart';
import 'package:athletic/home/screens/plan_mangament/plan_screen.dart';
import 'package:athletic/models/plan_model.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_btn/customBtn.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:athletic/tools/msg_dialog.dart';
import 'package:athletic/tools/waiting.dart';
import 'package:athletic/validator/field_val.dart';
import 'package:flutter/material.dart';

class AddPlanScreen extends StatefulWidget {
  final ApplicationController<PlanModel> controller;
  final PlanScreenType type;
  const AddPlanScreen(
      {super.key, required this.controller, required this.type});

  @override
  State<AddPlanScreen> createState() => _AddPlanScreenState();
}

class _AddPlanScreenState extends State<AddPlanScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController countDay = TextEditingController();
  TextEditingController discound = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    if (widget.type == PlanScreenType.days) {
      countDay.text = '1';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // const CustomAppbar(),
        // SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomContainer(
                pading: 5,
                color: Colors.white,
                raduis: 50,
                width: 0.1,
                child: TEXT(
                  center: true,
                  color: Theme.of(context).primaryColor,
                  text: getText('add_plan'),
                  size: 20,
                  bold: true,
                ),
              ),
              const SizedBox(height: 10),
              CustomContainer(
                width: 1,
                pading: 20,
                color: const Color(0xffF4DCAC),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      key: formKey,
                      child: Row(
                        children: [
                          Expanded(
                              child: CustomTextFieldByText2(
                            textWriteColor: Colors.black,
                            color: Colors.white,
                            controller: name,
                            labelText: getText('name'),
                            validator: (p0) {
                              return val(p0);
                            },
                          )),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: CustomTextFieldByText2(
                            enable: widget.type == PlanScreenType.month,
                            textWriteColor: Colors.black,
                            type: CustomTextFieldByTextType.number,
                            color: Colors.white,
                            controller: countDay,
                            labelText: getText('count_day'),
                            validator: (p0) {
                              return val(p0);
                            },
                          )),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: CustomTextFieldByText2(
                            type: CustomTextFieldByTextType.number,
                            textWriteColor: Colors.black,
                            color: Colors.white,
                            controller: price,
                            labelText: getText('price'),
                            validator: (p0) {
                              return val(p0);
                            },
                          )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CustomBtn(
                        onClick: () {
                          if (formKey.currentState!.validate()) {
                            msgDialog(
                              context1: context,
                              state: 0,
                              text: getText('add_msg'),
                              onClick: () async {
                                pOP(context);
                                waiting(context: context);
                                ApiData add = await PlanBase.add(
                                    planName: name.text,
                                    durationDays: countDay.text,
                                    price: price.text);
                                pOP(context);
                                msgDialog(
                                    context1: context,
                                    state: add.success ? 1 : -1,
                                    text: add.msg);
                                if (add.success) {
                                  name.clear();
                                  price.clear();
                                  countDay.clear();
                                  widget.controller
                                      .addItem(PlanModel.fromMap(add.data));
                                }
                              },
                            );
                          }
                        },
                        btnColor: Theme.of(context).primaryColor,
                        text: 'تأكيد',
                        textcolor: Theme.of(context).primaryColorDark,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
