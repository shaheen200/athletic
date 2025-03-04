// ignore_for_file: deprecated_member_use

import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/goods_base.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_appbar.dart';
import 'package:athletic/tools/custom_btn/customBtn.dart';
import 'package:athletic/tools/fields/custom_drop_down.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:athletic/tools/msg_dialog.dart';
import 'package:athletic/tools/waiting.dart';
import 'package:athletic/validator/field_val.dart';
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
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    state.equal([
      CustomDropDownItems(text: 'فعال', value: true.toString(), onTap: () {}),
      CustomDropDownItems(
          text: 'غير فعال', value: false.toString(), onTap: () {}),
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
              Form(
                key: formKey,
                child: CustomContainer(
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
                            validator: (p0) {
                              return val(p0);
                            },
                          )),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: CustomTextFieldByText2(
                            textWriteColor: Colors.black,
                            type: CustomTextFieldByTextType.number,
                            color: Colors.white,
                            controller: price,
                            labelText: getText('price'),
                            validator: (p0) {
                              return val(p0);
                            },
                          )),
                          const SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: CustomTextFieldByText2(
                            textWriteColor: Colors.black,
                            type: CustomTextFieldByTextType.number,
                            color: Colors.white,
                            controller: count,
                            labelText: getText('count'),
                            validator: (p0) {
                              return val(p0);
                            },
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
                                    ApiData add = await GoodsBase.add(
                                        count: int.parse(count.text),
                                        isActive: bool.parse(state.value!),
                                        name: name.text,
                                        price: (double.parse(price.text)));
                                    pOP(context);
                                    await msgDialog(
                                        context1: context,
                                        state: add.success ? 1 : -1,
                                        text: add.msg);
                                    if (add.success) {
                                      name.clear();
                                      price.clear();
                                      count.clear();

                                      widget.controller.addItem(add.data);
                                    }
                                  },
                                );
                              }
                            },
                            text: 'تأكيد',
                            textcolor: Theme.of(context).primaryColorLight,
                          ))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
