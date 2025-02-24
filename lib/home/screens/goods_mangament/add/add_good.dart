// ignore_for_file: deprecated_member_use

import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_appbar.dart';
import 'package:athletic/tools/custom_btn/customBtn.dart';
import 'package:athletic/tools/fields/custom_drop_down.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:flutter/material.dart';

class AddGood extends StatefulWidget {
  final ApplicationController controller;
  const AddGood({super.key, required this.controller});

  @override
  State<AddGood> createState() => _AddGoodState();
}

class _AddGoodState extends State<AddGood> {
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController count = TextEditingController();
  CustomDropDownController state = CustomDropDownController();
  TextEditingController discound = TextEditingController();

  @override
  void initState() {
    state.equal([
      CustomDropDownItems(text: 'فعال', onTap: () {}),
      CustomDropDownItems(text: 'غير فعال', onTap: () {}),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppbar(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.01),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TEXT(
                color: Theme.of(context).primaryColor,
                text: "    ${getText('add_good')}    ",
                size: 28,
                bold: true,
              ),
              const SizedBox(height: 10),
              CustomContainer(
                width: 1,
                pading: 20,
                color: Theme.of(context).primaryColor.withOpacity(0.5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: CustomTextFieldByText2(
                          color: Colors.white,
                          controller: name,
                          labelText: getText('name'),
                        )),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: CustomTextFieldByText2(
                          color: Colors.white,
                          controller: price,
                          labelText: getText('price'),
                        )),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: CustomTextFieldByText2(
                          color: Colors.white,
                          controller: count,
                          labelText: getText('count'),
                        )),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: CustomDropDown(
                          onChanged: (p0) {},
                          color: Colors.white,
                          controller: state,
                          labelText: getText('state'),
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
