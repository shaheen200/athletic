 import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_appbar.dart';
import 'package:athletic/tools/custom_btn/customBtn.dart';
 import 'package:athletic/tools/fields/custom_drop_down.dart';
import 'package:athletic/tools/fields/custom_field_time.dart';
import 'package:athletic/tools/fields/custom_text_field_by_text.dart';
import 'package:flutter/material.dart';

class Add_client extends StatefulWidget {
  Add_client({super.key});

  @override
  State<Add_client> createState() => _Add_clientState();
}

class _Add_clientState extends State<Add_client> {
  TextEditingController name = TextEditingController();

  TextEditingController data = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController discound = TextEditingController();

  void date(de) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      
          const Custom_appbar(),
          const TEXT(
            text: 'إضافه مشترك',
            size: 28,
            bold: true,
          ),
          Center(
            child: CustomContainer(
              width: .5,
              height: .6,
              child: Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                          child: CustomTextFieldByText(
                        labelText: 'اسم المشترك',
                      )),
                      const SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: CustomFieldDate(
                        onSelect: date,
                        controller: data,
                        labelText: 'تاريخ الانضمام',
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomTextFieldByText(
                        labelText: 'الهاتف',
                        controller: phone,
                      )),
                      const SizedBox(
                        width: 7,
                      ),
                      Expanded(
                          child: CustomTextFieldByText(
                        labelText: "البريد الإلكتروني",
                        controller: email,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Custom_drop_down(
                          title: 'الخطه', items: ['ahmed', 'mo', 'df']),
                      const SizedBox(
                        width: 10,
                      ),
                      const Expanded(
                          child: CustomTextFieldByText(
                        labelText: "السعر",
                      )),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          child: CustomTextFieldByText(
                        labelText: "خصم",
                        controller: discound,
                      )),
                    ],
                  )
                ],
              ),
            ),
          ),
          CustomBtn(onClick: (){}, text: 'تأكيد')
        ],
      ),
    );
  }
}
