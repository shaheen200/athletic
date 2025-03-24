import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/empolyee_base.dart';
import 'package:athletic/models/empolyee_model.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_dialog.dart';
import 'package:athletic/tools/fields/custom_drop_down.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:athletic/tools/msg_dialog.dart';
import 'package:athletic/tools/waiting.dart';
import 'package:athletic/validator/field_val.dart';
import 'package:flutter/material.dart';

editEmpDialog(
    {required BuildContext context,
    required ApplicationController<EmployeeModel> controller,
    required int index}) {
  CustomDropDownController gender = CustomDropDownController();
  CustomDropDownController job = CustomDropDownController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController salary = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  gender.equal([
    CustomDropDownItems(text: getText('male'), onTap: () {}),
    CustomDropDownItems(text: getText('female'), onTap: () {})
  ]);

  gender.setValue(controller.items[index].gender);

  name.text = controller.items[index].displayName;
  email.text = controller.items[index].email;
  salary.text = controller.items[index].salary.toString();

  customDialog(
    context: context,
    width: 0.4,
    child: FutureBuilder(
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
          job.setValue(controller.items[index].userRole.toString());
          return Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFieldByText2(
                        textWriteColor: Colors.black,
                        onChanged: (p0) {},
                        controller: email,
                        labelText: getText('email'),
                        color: Colors.white,
                        validator: (p0) {
                          return val(p0);
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomTextFieldByText2(
                        textWriteColor: Colors.black,
                        onChanged: (p0) {},
                        controller: name,
                        color: Colors.white,
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
                  type: CustomTextFieldByTextType.number,
                  labelText: getText('Salary'),
                  color: Colors.white,
                  controller: salary,
                  validator: (p0) {
                    return val(p0);
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
              ],
            ),
          );
        }
      },
    ),
    ok: () async {
      waiting(context: context);
      ApiData add = await EmpolyeeBase.updateEmployeeById(
          salary: double.parse(salary.text),
          displayName: name.text,
          email: email.text,
          id: controller.items[index].id,
          gender: gender.value!,
          userRole: int.parse(job.value ?? '0'));
      pOP(context);
      if (add.success) {
        pOP(context);
        controller.editItem(
          EmployeeModel(
              id: controller.items[index].id,
              displayName: name.text,
              email: email.text,
              salary: double.parse(salary.text),
              userRole: int.parse(job.value!),
              gender: gender.value.toString()),
          (p0, p1) {
            return p0.id == p1.id;
          },
        );
      }
      msgDialog(context1: context, state: add.success ? 1 : -1, text: add.msg);
    },
  );
}
