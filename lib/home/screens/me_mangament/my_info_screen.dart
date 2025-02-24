import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/custom_appbar.dart';
import 'package:athletic/tools/custom_image/customImage.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:flutter/material.dart';

class MyInfoScreen extends StatefulWidget {
  const MyInfoScreen({super.key});

  @override
  State<MyInfoScreen> createState() => _MyInfoScreenState();
}

class _MyInfoScreenState extends State<MyInfoScreen> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController salary = TextEditingController();
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
              CustomContainer(
                width: .4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CustomImage(path: 'image/user.png', w: 0.2, h: 0.1),
                    const SizedBox(height: 20),
                    CustomTextFieldByText2(
                      controller: name,
                      labelText: getText('name'),
                    ),
                    const SizedBox(height: 10),
                    CustomTextFieldByText2(
                      controller: phone,
                      labelText: getText('phone'),
                    ),
                    const SizedBox(height: 10),
                    CustomTextFieldByText2(
                      controller: salary,
                      labelText: getText('Coach Salary'),
                    ),
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
