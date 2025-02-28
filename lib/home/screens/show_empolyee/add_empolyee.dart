// ignore_for_file: must_be_immutable

import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_appbar.dart';
import 'package:athletic/tools/custom_btn/customBtn.dart';
import 'package:athletic/tools/fields/custom_drop_down.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:flutter/material.dart';

class AddEmpolyee extends StatefulWidget {
  const AddEmpolyee({super.key});

  @override
  State<AddEmpolyee> createState() => _AddEmpolyeeState();
}

class _AddEmpolyeeState extends State<AddEmpolyee> {
  CustomDropDownController gender = CustomDropDownController();
  CustomDropDownController job = CustomDropDownController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController salary = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void initState() {
    gender.equal([
      CustomDropDownItems(text: getText('male'), onTap: () {}),
      CustomDropDownItems(text: getText('female'), onTap: () {})
    ]);
    job.equal([
      CustomDropDownItems(text: 'كاشير', onTap: () {}),
      CustomDropDownItems(text: 'كابتن', onTap: () {})
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppbar(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TEXT(
                color: Theme.of(context).primaryColor,
                text: getText('add_emp'),
                size: 28,
                bold: true,
              ),
              const SizedBox(height: 10),
              CustomContainer(
                width: .5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextFieldByText2(
                            onChanged: (p0) {},
                            controller: email,
                            labelText: getText('email'),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextFieldByText2(
                            onChanged: (p0) {},
                            controller: name,
                            labelText: getText('name'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: CustomTextFieldByText2(
                              labelText: getText('Salary'),
                              controller: salary,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 1,
                            child: CustomTextFieldByText2(
                              labelText: getText('phone'),
                              controller: phone,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomDropDown(
                            controller: gender,
                            labelText: getText('Gender'),
                            onChanged: (p0) {},
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          flex: 1,
                          child: CustomDropDown(
                            controller: job,
                            labelText: getText('job'),
                            onChanged: (p0) {},
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: CustomBtn(
                          onClick: () {},
                          text: 'تأكيد',
                          textcolor: Theme.of(context).primaryColorLight,
                        ))
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
