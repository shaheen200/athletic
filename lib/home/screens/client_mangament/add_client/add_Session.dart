import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_appbar.dart';
import 'package:athletic/tools/custom_btn/customBtn.dart';
import 'package:athletic/tools/fields/custom_drop_down.dart';
import 'package:flutter/material.dart';

import '../../../../provider/language/get_text.dart';
import '../../../../tools/fields/custom_field_by_text_2.dart';

class AddSession extends StatefulWidget {
  const AddSession({super.key});

  @override
  State<AddSession> createState() => _AddSessionState();
}

class _AddSessionState extends State<AddSession> {
  TextEditingController price = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController total = TextEditingController();
  final CustomDropDownController controller = CustomDropDownController();

  void date(de) {}

  @override
  void initState() {
    controller.equal([
      CustomDropDownItems(text: '123', onTap: () {}),
      CustomDropDownItems(text: '1233', onTap: () {}),
      CustomDropDownItems(text: '124443', onTap: () {}),
      CustomDropDownItems(text: '1235', onTap: () {}),
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
                text: getText('add_day'),
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
                          flex: 1,
                          child: CustomDropDown(
                            controller: controller,
                            labelText: getText('plan'),
                            onChanged: (p0) {},
                          ),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: CustomTextFieldByText2(
                          textWriteColor: Colors.black,
                          type: CustomTextFieldByTextType.number,
                          icon: Icons.date_range_rounded,
                          onChanged: (p0) {},
                          enable: false,
                          controller: price,
                          labelText: getText('price'),
                        ))
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
                              textWriteColor: Colors.black,
                              type: CustomTextFieldByTextType.text,
                              controller: name,
                              labelText: getText('name'),
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 1,
                            child: CustomTextFieldByText2(
                              labelText: getText('total'),
                              controller: total,
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
