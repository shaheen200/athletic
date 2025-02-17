// ignore_for_file: use_build_context_synchronously
import 'package:athletic/home/home_page.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/funTool.dart';
import 'package:flutter/material.dart';
import '../provider/language/get_text.dart';
import '../tools/custom_btn/customBtn.dart';
import '../tools/custom_image/customImage.dart';
import '../tools/fields/custom_text_field_by_text.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController phone = TextEditingController();
  final TextEditingController pw = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
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
                  CustomTextFieldByText(
                      labelText: getText("email"),
                      icon: Icons.phone,
                      controller: phone,
                      validator: (p0) {
                        if (p0 == null) {
                          return getText("field_empty");
                        } else if (p0.isEmpty) {
                          return getText("field_empty");
                        }
                        return null;
                      }),
                  const SizedBox(height: 10),
                  CustomTextFieldByText(
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
                        goPage(context, const HomePage());
                        // if (formKey.currentState!.validate()) {}
                      },
                      text: getText("login"),textcolor: Theme.of(context).primaryColorLight,),
                      
                ],
              ),
            ),
          ),
          const CustomImage(path: "image/logo.png", w: 0.3, h: 1)
        ],
      ),
    );
  }
}
