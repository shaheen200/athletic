import 'package:athletic/tools/custom_dialog.dart';
import 'package:flutter/material.dart';

import '../../provider/language/get_text.dart';
import '../fields/custom_field_time.dart';
import '../waiting.dart';

class CustomBtnDateBetween extends StatelessWidget {
  final void Function(String start, String end) onselect;
  const CustomBtnDateBetween({super.key, required this.onselect});

  @override
  Widget build(BuildContext context) {
    final TextEditingController date1 = TextEditingController();
    final TextEditingController date2 = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return IconButton(
        onPressed: () {
          customDialog(
            context: context,
            width: 0.3,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomFieldDate(
                      controller: date1,
                      labelText: getText("from"),
                      onSelect: (p0) {
                        date1.text = p0;
                      },
                      validator: (p0) {
                        if (p0 == null) {
                          return getText("field_empty");
                        }
                        if (p0.isEmpty) {
                          return getText("field_empty");
                        }
                        return null;
                      }),
                  CustomFieldDate(
                      controller: date2,
                      labelText: getText("to"),
                      onSelect: (p0) {
                        date2.text = p0;
                      },
                      validator: (p0) {
                        if (p0 == null) {
                          return getText("field_empty");
                        }
                        if (p0.isEmpty) {
                          return getText("field_empty");
                        }
                        return null;
                      })
                ],
              ),
            ),
            ok: () {
              if (formKey.currentState!.validate()) {
                pOP(context);
                onselect.call(date1.text, date2.text);
              }
            },
          );
        },
        icon: Icon(Icons.alarm,
            color: Theme.of(context).primaryColorDark, size: 35));
  }
}
