import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/local_base.dart';
import 'package:athletic/database/me_base.dart';
import 'package:athletic/models/user_model.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_appbar.dart';
import 'package:athletic/tools/custom_btn/customBtn.dart';
import 'package:athletic/tools/custom_image/customImage.dart';
import 'package:athletic/tools/fields/custom_text_field_by_text.dart';
import 'package:athletic/tools/msg_dialog.dart';
import 'package:athletic/tools/waiting.dart';
import 'package:athletic/validator/field_val.dart';
import 'package:flutter/material.dart';

class MyInfoScreen extends StatefulWidget {
  const MyInfoScreen({super.key});

  @override
  State<MyInfoScreen> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController oldPw = TextEditingController();
  TextEditingController newPw1 = TextEditingController();
  TextEditingController newPw2 = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  UserModel? userData;
  @override
  void initState() {
    LocalBase.getUserData().then(
      (value) {
        name.text = value!.userName;
        email.text = value.email;
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MeBase.getData(),
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
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppbar(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomContainer(
                    color: const Color(0xffEFCF8B),
                    width: 0.3,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CustomImage(
                            path: 'image/user.png', w: 0.2, h: 0.1),
                        Align(
                            alignment: Alignment.centerRight,
                            child: TEXT(text: getText('name'), size: 17)),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: TEXT(
                                text: snapshot.data!.data['Data']['UserName']
                                    .toString(),
                                size: 17)),
                        const SizedBox(height: 10),
                        Align(
                            alignment: Alignment.centerRight,
                            child: TEXT(text: getText('email'), size: 17)),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: TEXT(
                                text: snapshot.data!.data['Data']['Email']
                                    .toString(),
                                size: 17)),
                        const SizedBox(height: 10),
                        Align(
                            alignment: Alignment.centerRight,
                            child: TEXT(text: getText('Gender'), size: 17)),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: TEXT(
                                text: snapshot.data!.data['Data']['Gender']
                                    .toString(),
                                size: 17)),
                        const SizedBox(height: 10),
                        Align(
                            alignment: Alignment.centerRight,
                            child: TEXT(text: getText('job'), size: 17)),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: TEXT(
                                text: snapshot.data!.data['Data']['Roles'][0]
                                    .toString(),
                                size: 17)),
                      ],
                    ),
                  ),
                  Visibility(
                    visible: snapshot.data!.data['admin'],
                    child: Form(
                      key: formKey,
                      child: CustomContainer(
                        color: const Color(0xffEFCF8B),
                        width: 0.3,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomTextFieldByText(
                              pw: true,
                              controller: oldPw,
                              labelText: getText('old_pw'),
                              validator: (p0) {
                                return val(p0);
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextFieldByText(
                              pw: true,
                              controller: newPw1,
                              labelText: getText('new_pw'),
                              validator: (p0) {
                                return val(p0);
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomTextFieldByText(
                              pw: true,
                              controller: newPw2,
                              labelText: getText('confirm_pw'),
                              validator: (p0) {
                                if (p0 == null) {
                                  return getText("field_empty");
                                }
                                if (p0.isEmpty) {
                                  return getText("field_empty");
                                }
                                if (p0 != newPw1.text) {
                                  return getText('pw_not_match');
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20),
                            CustomBtn(
                                onClick: () async {
                                  if (formKey.currentState!.validate()) {
                                    waiting(context: context);
                                    ApiData change = await MeBase.changePw(
                                        oldPw: oldPw.text, newPw: newPw1.text);
                                    pOP(context);
                                    if (change.success) {
                                      oldPw.clear();
                                      newPw1.clear();
                                      newPw2.clear();
                                    }
                                    msgDialog(
                                        context1: context,
                                        state: change.success ? 1 : -1,
                                        text: change.msg);
                                  }
                                },
                                text: getText('change_password'))
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          );
        }
      },
    );
  }
}
