// ignore_for_file: use_build_context_synchronously
import 'package:athletic/controller/change_theme.dart';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/login_base.dart';
import 'package:athletic/home/home_page.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:athletic/tools/funTool.dart';
import 'package:athletic/tools/msg_dialog.dart';
import 'package:athletic/tools/waiting.dart';
import 'package:flutter/material.dart';
import '../provider/language/get_text.dart';
import '../tools/custom_btn/customBtn.dart';
import '../tools/custom_image/customImage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController pw = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    email.text = "mohamedbedosalah2003@gmail.com";
    pw.text = "Pa\$\$w0rd123!";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection:
            ChangeProvider.language ? TextDirection.ltr : TextDirection.rtl,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Form(
              key: formKey,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.38,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TEXT(
                        text: getText('login'),
                        size: 25,
                        bold: true,
                        color: Theme.of(context).primaryColor),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                    CustomTextFieldByText2(
                        colorBorder: Theme.of(context).primaryColor,
                        color: Colors.white,
                        textWriteColor: Colors.black,
                        labelText: getText("email"),
                        labelcolor: Colors.white,
                        icon: Icons.email,
                        controller: email,
                        validator: (p0) {
                          if (p0 == null) {
                            return getText("field_empty");
                          } else if (p0.isEmpty) {
                            return getText("field_empty");
                          }
                          return null;
                        }),
                    const SizedBox(height: 10),
                    CustomTextFieldByText2(
                        colorBorder: Theme.of(context).primaryColor,
                        color: Colors.white,
                        labelcolor: Colors.white,
                        textWriteColor: Colors.black,
                        labelText: getText("pw"),
                        icon: Icons.lock,
                        pw: true,
                        controller: pw,
                        validator: (p0) {
                          if (p0 == null) {
                            return getText("field_empty");
                          } else if (p0.isEmpty) {
                            return getText("field_empty");
                          }
                          return null;
                        }),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                    CustomBtn(
                      height: 55,
                      raduis: 10,
                      w: 1,
                      onClick: () async {
                        if (formKey.currentState!.validate()) {
                          waiting(context: context);
                          ApiData login = await LoginBase.login(
                              email: email.text, pw: pw.text);
                          pOP(context);
                          if (login.success) {
                            goToPage(context, const HomePage());
                          } else {
                            msgDialog(
                                context1: context, state: -1, text: login.msg);
                          }
                        }
                      },
                      text: getText("login"),
                      textcolor: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
            const CustomImage(path: "image/logo.png", w: 0.3, h: 1)
          ],
        ),
      ),
    );
  }
}
