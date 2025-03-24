import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/home/screens/show_empolyee/dialog/edit_emp_dialog.dart';
import 'package:athletic/method/get_job_name.dart';
import 'package:athletic/models/empolyee_model.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/Custom_Table.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/pop_menu/custom_pop.dart';
import 'package:flutter/material.dart';

class ShowEmpolyeeView extends StatefulWidget {
  final ApplicationController<EmployeeModel> controller;
  const ShowEmpolyeeView({super.key, required this.controller});

  @override
  State<ShowEmpolyeeView> createState() => _ShowEmpolyeeViewState();
}

class _ShowEmpolyeeViewState extends State<ShowEmpolyeeView> {
  @override
  void initState() {
    widget.controller.addListener(
      () {
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.controller.items.length,
      itemBuilder: (context, index) {
        return CustomBodyTable(
          headData: [
            CustomBodyTableItems(
                flex: 1,
                widget: TEXT(
                    text: widget.controller.items[index].displayName,
                    size: 17)),
            CustomBodyTableItems(
                flex: 1,
                widget:
                    TEXT(text: widget.controller.items[index].email, size: 17)),
            CustomBodyTableItems(
                flex: 1,
                widget: TEXT(
                    text: widget.controller.items[index].gender, size: 17)),
            CustomBodyTableItems(
                flex: 1,
                widget: TEXT(
                    text: '${widget.controller.items[index].salary}',
                    size: 17)),
            CustomBodyTableItems(
                flex: 1,
                widget: TEXT(
                    text: getJobName(widget.controller.items[index].userRole),
                    size: 17)),
            CustomBodyTableItems(
              flex: 1,
              widget: CustomPop(
                items: [
                  CustomPopItems(
                    text: getText('edit'),
                    onTap: () {
                      editEmpDialog(
                          context: context,
                          controller: widget.controller,
                          index: index);
                    },
                  ),
                  CustomPopItems(
                    text: getText('Actions'),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
