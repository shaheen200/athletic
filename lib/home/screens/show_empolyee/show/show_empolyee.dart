import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/database/empolyee_base.dart';
import 'package:athletic/home/screens/show_empolyee/show/show_empolyee_view.dart';
import 'package:athletic/models/empolyee_model.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/Custom_Table.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_appbar.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:flutter/material.dart';

class ShowEmpolyee extends StatelessWidget {
  const ShowEmpolyee({super.key});

  @override
  Widget build(BuildContext context) {
    final ApplicationController<EmployeeModel> controller =
        ApplicationController<EmployeeModel>();
    return FutureBuilder(
      future: EmpolyeeBase.getAllEmp(),
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
          controller.equal(snapshot.data!.data);
          return Column(
            children: [
              const CustomAppbar(),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TEXT(
                    text: getText('show_emp'),
                    size: 32,
                    bold: true,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Expanded(
                child: CustomContainer(
                  margin: 40,
                  width: 0.9,
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomTextFieldByText2(
                                  hintText: getText(
                                    'search',
                                  ),
                                  color: Theme.of(context).primaryColor,
                                  onChanged: (p0) {
                                    controller.search(
                                        p0, (p0) => p0.displayName);
                                  },
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.search_outlined,
                                color: Theme.of(context).primaryColorLight,
                                size: 30,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomHeadTable(headData: [
                          CustomHeadTableItems(flex: 1, text: getText('name')),
                          CustomHeadTableItems(flex: 1, text: getText('email')),
                          CustomHeadTableItems(
                              flex: 1, text: getText('Gender')),
                          CustomHeadTableItems(
                              flex: 1, text: getText('Salary')),
                          CustomHeadTableItems(flex: 1, text: getText('job')),
                          CustomHeadTableItems(flex: 1, text: getText('more')),
                        ]),
                        Expanded(
                            child: ShowEmpolyeeView(controller: controller))
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}

/**
 * Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TEXT(
                      text: getText('name'),
                      size: 18,
                      color: Theme.of(context).hintColor,
                    ),
                    TEXT(
                      text: getText('phone'),
                      size: 18,
                      color: Theme.of(context).hintColor,
                    ),
                    TEXT(
                      text: getText('Gender'),
                      size: 18,
                      color: Theme.of(context).hintColor,
                    ),
                    TEXT(
                      text: getText('Salary'),
                      size: 18,
                      color: Theme.of(context).hintColor,
                    ),
                    TEXT(
                      text: getText('Actions'),
                      size: 18,
                      color: Theme.of(context).hintColor,
                    )
                  ],
                ),
 */
