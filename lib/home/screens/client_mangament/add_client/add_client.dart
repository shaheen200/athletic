import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_appbar.dart';
import 'package:athletic/tools/custom_btn/customBtn.dart';
import 'package:athletic/tools/fields/custom_drop_down.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:flutter/material.dart';

class AddClient extends StatefulWidget {
  const AddClient({super.key});

  @override
  State<AddClient> createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  TextEditingController name = TextEditingController();

  TextEditingController data = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController discound = TextEditingController();
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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomAppbar(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TEXT(
                color: Theme.of(context).primaryColor,
                text: getText('add_client'),
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
                          labelText: getText('subscrip_name'),
                        )),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: CustomTextFieldByText2(
                          type: CustomTextFieldByTextType.date,
                          icon: Icons.date_range_rounded,
                          onChanged: (p0) {},
                          controller: data,
                          labelText: getText('enter_date'),
                        ))
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: CustomTextFieldByText2(
                          labelText: getText('phone'),
                          controller: phone,
                        )),
                        const SizedBox(
                          width: 7,
                        ),
                        Expanded(
                            child: CustomTextFieldByText2(
                          labelText: getText('email'),
                          controller: email,
                        )),
                      ],
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
                            labelText: getText('plan'),
                            onChanged: (p0) {},
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 1,
                            child: CustomTextFieldByText2(
                              labelText: getText('price'),
                              enable: false,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            flex: 1,
                            child: CustomTextFieldByText2(
                              labelText: getText('discount'),
                              controller: discound,
                            )),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: CustomBtn(onClick: () {}, text: 'تأكيد',textcolor: Theme.of(context).primaryColorLight,))
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
