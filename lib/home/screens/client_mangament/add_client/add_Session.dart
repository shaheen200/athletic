import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/custom_appbar.dart';
import 'package:athletic/tools/custom_btn/customBtn.dart';
import 'package:athletic/tools/fields/custom_drop_down.dart';
import 'package:athletic/tools/fields/custom_field_time.dart';
import 'package:athletic/tools/fields/custom_text_field_by_text.dart';
import 'package:flutter/material.dart';

class Add_Session extends StatelessWidget {
  Add_Session({super.key});
  TextEditingController discound = TextEditingController();
  TextEditingController data = TextEditingController();
  void date(de) {}

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Custom_appbar(),
        SizedBox(
          height: MediaQuery.of(context).size.height / 8,
        ),
        CustomContainer(
          width: .6,
          height: .4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Custom_drop_down(
                      title: 'الخطه', items: ['حصه', 'كارديو', 'اطفال']),
                  const SizedBox(
                    width: 50,
                  ),
                  const Expanded(
                      child: CustomTextFieldByText(
                    labelText: "السعر",
                    enable: false,
                  )),
                  const SizedBox(
                    width: 50,
                  ),
                  Expanded(
                      child: CustomTextFieldByText(
                    labelText: "خصم",
                    controller: discound,
                  )),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                      CustomBtn(onClick: () {}, text: 'تأكيد'),
                  SizedBox(
                      width: MediaQuery.of(context).size.width / 4,
                      child: CustomFieldDate(
                        onSelect: date,
                        controller: data,
                        labelText: 'تاريخ الانضمام',
                      )),
                          

                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
