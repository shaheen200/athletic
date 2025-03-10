import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/days_base.dart';
import 'package:athletic/database/plan_base.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_appbar.dart';
import 'package:athletic/tools/custom_btn/customBtn.dart';
import 'package:athletic/tools/fields/custom_drop_down.dart';
import 'package:athletic/tools/msg_dialog.dart';
import 'package:athletic/tools/waiting.dart';
import 'package:athletic/validator/field_val.dart';
import 'package:flutter/material.dart';

import '../../../../provider/language/get_text.dart';
import '../../../../tools/fields/custom_field_by_text_2.dart';

class AddSession extends StatelessWidget {
  const AddSession({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController price = TextEditingController();
    TextEditingController name = TextEditingController();
    final CustomDropDownController controller = CustomDropDownController();
    return FutureBuilder(
      future: PlanBase.getPlanType(day: true),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.data!.success) {
          return Center(
            child: TEXT(text: snapshot.data!.msg, size: 18, bold: true),
          );
        } else {
          controller.equal(snapshot.data!.data.map(
            (e) {
              return CustomDropDownItems(
                  text: e.planName,
                  value: e.id.toString(),
                  onTap: () {
                    price.text = e.price.toString();
                  });
            },
          ).toList());
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
                    Form(
                      key: formKey,
                      child: CustomContainer(
                        width: .4,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomDropDown(
                              controller: controller,
                              labelText: getText('plan'),
                              validator: (p0) {
                                return val(p0);
                              },
                              onChanged: (p0) {},
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomTextFieldByText2(
                              textWriteColor: Colors.black,
                              type: CustomTextFieldByTextType.number,
                              icon: Icons.date_range_rounded,
                              onChanged: (p0) {},
                              enable: false,
                              controller: price,
                              labelText: getText('price'),
                              validator: (p0) {
                                return val(p0);
                              },
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            CustomTextFieldByText2(
                              textWriteColor: Colors.black,
                              type: CustomTextFieldByTextType.text,
                              controller: name,
                              labelText: getText('name'),
                              validator: (p0) {
                                return val(p0);
                              },
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
                                          ApiData add = await DaysBase.add(
                                              name: name.text,
                                              planId: controller.value!);
                                          pOP(context);
                                          await msgDialog(
                                              context1: context,
                                              state: add.success ? 1 : -1,
                                              text: add.msg);
                                          if (add.success) {
                                            price.clear();
                                            name.clear();
                                          }
                                        },
                                      );
                                    }
                                  },
                                  text: 'تأكيد',
                                  textcolor:
                                      Theme.of(context).primaryColorLight,
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
      },
    );
  }
}
