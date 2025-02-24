// ignore_for_file: must_be_immutable

import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_appbar.dart';
import 'package:athletic/tools/custom_btn/customBtn.dart';
import 'package:athletic/tools/fields/custom_drop_down.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:flutter/material.dart';

class AddEmpolyee extends StatelessWidget {
  AddEmpolyee({super.key});
  CustomDropDownController controller = CustomDropDownController();
  TextEditingController name = TextEditingController();
  TextEditingController salary = TextEditingController();

  TextEditingController phone = TextEditingController();

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
                text: getText('Add Coach'),
                size: 28,
                bold: true,
              ),
              const SizedBox(height: 10),
              CustomContainer(
                width: .5,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomTextFieldByText2(
                      icon: Icons.date_range_rounded,
                      onChanged: (p0) {},
                      enable: false,
                      controller: name,
                      labelText: getText('name'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: CustomDropDown(
                            controller: controller,
                            labelText: getText('Gender'),
                            onChanged: (p0) {},
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
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
