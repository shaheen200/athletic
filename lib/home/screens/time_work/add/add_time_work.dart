// ignore_for_file: deprecated_member_use

import 'package:athletic/constant/list_of_day.dart';
import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/time_work_base.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_btn/customBtn.dart';
import 'package:athletic/tools/fields/custom_drop_down.dart';
import 'package:athletic/tools/fields/custom_field_time.dart';
import 'package:athletic/tools/msg_dialog.dart';
import 'package:athletic/tools/waiting.dart';
import 'package:athletic/validator/field_val.dart';
import 'package:flutter/material.dart';

class AddTimeWork extends StatefulWidget {
  final ApplicationController controller;
  const AddTimeWork({super.key, required this.controller});

  @override
  State<AddTimeWork> createState() => _AddTimeWorkState();
}

class _AddTimeWorkState extends State<AddTimeWork> {
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  CustomDropDownController day = CustomDropDownController();
  CustomDropDownController name = CustomDropDownController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    day.equal(listOfDayEn
        .map((e) =>
            CustomDropDownItems(text: e, value: e.toString(), onTap: () {}))
        .toList());
    name.equal(['Men', 'Mixed', 'Ladies']
        .map((e) =>
            CustomDropDownItems(text: e, value: e.toString(), onTap: () {}))
        .toList());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomContainer(
          pading: 5,
          margin: 10,
          color: Colors.white,
          raduis: 50,
          width: 0.1,
          child: TEXT(
            center: true,
            color: Theme.of(context).primaryColor,
            text: getText('table_work'),
            size: 20,
            bold: true,
          ),
        ),
        Form(
          key: formKey,
          child: CustomContainer(
            margin: 20,
            width: 1,
            pading: 20,
            color: const Color(0xffEFCF8B),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                        child: CustomDropDown(
                      onChanged: (p0) {},
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
                        child: CustomFieldDate(
                      onSelect: (p0) {},
                      type: CustomFieldDateType.time,
                      controller: startDate,
                      labelText: getText('start_time'),
                      validator: (p0) {
                        return val(p0);
                      },
                    )),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomDropDown(
                      onChanged: (p0) {},
                      color: Colors.white,
                      controller: day,
                      labelText: getText('day'),
                      validator: (p0) {
                        return val(p0);
                      },
                    )),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                        child: CustomFieldDate(
                      type: CustomFieldDateType.time,
                      onSelect: (p0) {},
                      controller: endDate,
                      labelText: getText('end_time'),
                      validator: (p0) {
                        return val(p0);
                      },
                    )),
                  ],
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
                              ApiData add = await TimeWorkBase.add(
                                dayOfWeek: day.value.toString(),
                                endTime: endDate.text,
                                groupType: name.value.toString(),
                                startTime: startDate.text,
                              );
                              pOP(context);
                              await msgDialog(
                                  context1: context,
                                  state: add.success ? 1 : -1,
                                  text: add.msg);
                              if (add.success) {
                                name.clear();
                                startDate.clear();
                                endDate.clear();
                                day.clear();

                                widget.controller.addItem(add.data);
                              }
                            },
                          );
                        }
                      },
                      text: 'تأكيد',
                      textcolor: Theme.of(context).primaryColorDark,
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
