// ignore_for_file: deprecated_member_use

import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_appbar.dart';
import 'package:athletic/tools/custom_btn/customBtn.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:flutter/material.dart';

class AddPlanScreen extends StatefulWidget {
  const AddPlanScreen({super.key});

  @override
  State<AddPlanScreen> createState() => _AddPlanScreenState();
}

class _AddPlanScreenState extends State<AddPlanScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController countDay = TextEditingController();
  TextEditingController discound = TextEditingController();
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
                text: "    ${getText('add_plan')}    ",
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
                          textWriteColor: Colors.black,
                          color: Colors.white,
                          controller: name,
                          labelText: getText('name'),
                        )),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: CustomTextFieldByText2(
                          textWriteColor: Colors.black,
                          type: CustomTextFieldByTextType.number,
                          color: Colors.white,
                          controller: countDay,
                          labelText: getText('count_day'),
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
