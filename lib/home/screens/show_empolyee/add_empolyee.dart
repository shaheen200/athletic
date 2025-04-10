// ignore_for_file: must_be_immutable

import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/empolyee_base.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_btn/customBtn.dart';
import 'package:athletic/tools/fields/custom_drop_down.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:athletic/tools/msg_dialog.dart';
import 'package:athletic/tools/waiting.dart';
import 'package:athletic/validator/field_val.dart';
import 'package:flutter/material.dart';

class AddEmpolyee extends StatefulWidget {
  const AddEmpolyee({super.key});

  @override
  State<AddEmpolyee> createState() => _AddEmpolyeeState();
}

class _AddEmpolyeeState extends State<AddEmpolyee> {
  CustomDropDownController gender = CustomDropDownController();
  late CustomDropDownController job;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController salary = TextEditingController();
  // TextEditingController phone = TextEditingController();
  TextEditingController pw = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    job = CustomDropDownController();
    gender.equal([
      CustomDropDownItems(text: getText('male'), onTap: () {}),
      CustomDropDownItems(text: getText('female'), onTap: () {})
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: EmpolyeeBase.getAllRoles(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.data!.success) {
          return Center(
            child: TEXT(
              text: snapshot.data!.msg,
              size: 18,
              bold: true,
              color: Colors.white,
            ),
          );
        } else {
          job.equal(snapshot.data!.data.map(
            (e) {
              return CustomDropDownItems(
                  text: e.name, value: e.id.toString(), onTap: () {});
            },
          ).toList());
          return Form(
            key: formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomContainer(
                    pading: 5,
                    color: Colors.white,
                    raduis: 50,
                    width: 0.1,
                    child: TEXT(
                      center: true,
                      color: Theme.of(context).primaryColor,
                      text: getText('add_emp'),
                      size: 20,
                      bold: true,
                    ),
                  ),
                  const SizedBox(height: 10),
                  CustomContainer(
                    width: .5,
                    color: const Color(0xffEFCF8B),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: CustomTextFieldByText2(
                                textWriteColor: Colors.black,
                                color: Colors.white,
                                onChanged: (p0) {},
                                controller: email,
                                labelText: getText('email'),
                                validator: (p0) {
                                  return val(p0);
                                },
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: CustomTextFieldByText2(
                                textWriteColor: Colors.black,
                                color: Colors.white,
                                onChanged: (p0) {},
                                controller: name,
                                labelText: getText('name'),
                                validator: (p0) {
                                  return val(p0);
                                },
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: CustomTextFieldByText2(
                                textWriteColor: Colors.black,
                                color: Colors.white,
                                labelText: getText('pw'),
                                pw: true,
                                controller: pw,
                                validator: (p0) {
                                  return val(p0);
                                },
                              ),
                            ),
                            // const SizedBox(
                            //   width: 10,
                            // ),
                            // Expanded(
                            //     flex: 1,
                            //     child: CustomTextFieldByText2(
                            // textWriteColor: Colors.black,
                            // color: Colors.white,
                            //       textWriteColor: Colors.black,
                            //       type: CustomTextFieldByTextType.number,
                            //       labelText: getText('phone'),
                            //       controller: phone,
                            //       validator: (p0) {
                            //         return val(p0);
                            //       },
                            //     )),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: CustomDropDown(
                                controller: gender,
                                labelText: getText('Gender'),
                                onChanged: (p0) {},
                                validator: (p0) {
                                  return val(p0);
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              flex: 1,
                              child: CustomDropDown(
                                controller: job,
                                labelText: getText('job'),
                                onChanged: (p0) {},
                                validator: (p0) {
                                  return val(p0);
                                },
                              ),
                            ),
                          ],
                        ),
                        CustomTextFieldByText2(
                          textWriteColor: Colors.black,
                          color: Colors.white,
                          type: CustomTextFieldByTextType.number,
                          labelText: getText('Salary'),
                          controller: salary,
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
                                      ApiData add = await EmpolyeeBase.addUsers(
                                          salary: salary.text,
                                          displayName: name.text,
                                          email: email.text,
                                          phoneNumber: '',
                                          password: pw.text,
                                          confirmPassword: pw.text,
                                          gender: gender.value!,
                                          userRole:
                                              int.parse(job.value ?? '0'));
                                      pOP(context);
                                      if (add.success) {
                                        name.clear();
                                        salary.clear();
                                        pw.clear();
                                        email.clear();
                                        gender.clear();
                                        job.clear();
                                      }
                                      msgDialog(
                                          context1: context,
                                          state: add.success ? 1 : -1,
                                          text: add.msg);
                                    },
                                  );
                                }
                              },
                              text: 'تأكيد',
                              textcolor: Theme.of(context).primaryColorDark,
                            ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
