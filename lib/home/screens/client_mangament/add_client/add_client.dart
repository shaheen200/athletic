import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/client_base.dart';
import 'package:athletic/database/plan_base.dart';
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

class AddClient extends StatefulWidget {
  const AddClient({super.key});

  @override
  State<AddClient> createState() => _AddClientState();
}

class _AddClientState extends State<AddClient> {
  TextEditingController name = TextEditingController();
  TextEditingController data = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController countDay = TextEditingController();
  final CustomDropDownController controller = CustomDropDownController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PlanBase.getAllPlans(),
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
                    countDay.text = e.durationDays.toString();
                    price.text = e.price.toString();
                  });
            },
          ).toList());
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
                    Form(
                      key: formKey,
                      child: CustomContainer(
                        width: .5,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    child: CustomTextFieldByText2(
                                  textWriteColor: Colors.black,
                                  labelText: getText('subscrip_name'),
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
                                  type: CustomTextFieldByTextType.date,
                                  icon: Icons.date_range_rounded,
                                  onChanged: (p0) {},
                                  controller: data,
                                  labelText: getText('enter_date'),
                                  validator: (p0) {
                                    return val(p0);
                                  },
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
                                  textWriteColor: Colors.black,
                                  labelText: getText('phone'),
                                  validator: (p0) {
                                    return val(p0);
                                  },
                                  type: CustomTextFieldByTextType.number,
                                  controller: phone,
                                )),
                                const SizedBox(
                                  width: 7,
                                ),
                                Expanded(
                                    child: CustomTextFieldByText2(
                                  textWriteColor: Colors.black,
                                  labelText: getText('email'),
                                  validator: (p0) {
                                    return val(p0);
                                  },
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
                                    validator: (p0) {
                                      return val(p0);
                                    },
                                    onChanged: (p0) {},
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    flex: 1,
                                    child: CustomTextFieldByText2(
                                      controller: price,
                                      textWriteColor: Colors.black,
                                      type: CustomTextFieldByTextType.number,
                                      labelText: getText('price'),
                                      validator: (p0) {
                                        return val(p0);
                                      },
                                      enable: false,
                                    )),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    flex: 1,
                                    child: CustomTextFieldByText2(
                                      enable: false,
                                      textWriteColor: Colors.black,
                                      type: CustomTextFieldByTextType.number,
                                      labelText: getText('count_day'),
                                      validator: (p0) {
                                        return val(p0);
                                      },
                                      controller: countDay,
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
                                          // ApiData add =
                                          // await ClientBase.addMemberShip();
                                          pOP(context);
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
