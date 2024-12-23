import 'package:flutter/material.dart';
import '../container/custom_container.dart';
import '../customText.dart';

class CustomFieldDate extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSelect;
  const CustomFieldDate(
      {super.key,
      required this.onSelect,
      this.controller,
      this.onChanged,
      this.labelText,
      this.hintText,
      this.validator});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        DateTime? date = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2024),
            lastDate: DateTime(2124));
        if (date != null) {
          onSelect!.call("$date".split(" ")[0]);
          if (controller != null) {
            controller!.text = "$date".split(" ")[0];
          }
        } else {
          onSelect!.call("");
        }
      },
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Visibility(
              visible: labelText == null ? false : true,
              child: TEXT(
                  text: " $labelText ",
                  size: 20,
                  bold: true,
                  color: Theme.of(context).primaryColorDark),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: CustomContainer(
                width: 1,
                pading: 0,
                margin: 0,
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Icon(
                      Icons.date_range_outlined,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(
                            color: Theme.of(context).primaryColorDark),
                        enabled: false,
                        onChanged: onChanged,
                        controller: controller,
                        validator: validator,
                        decoration: InputDecoration(
                            hintText: hintText,
                            contentPadding:
                                const EdgeInsets.only(left: 15, right: 15),
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
