import 'package:flutter/material.dart';
import '../customText.dart';

enum CustomFieldDateType { date, time }

class CustomFieldDate extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final Color? labelColor;
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSelect;
  final CustomFieldDateType type;

  const CustomFieldDate(
      {super.key,
      required this.onSelect,
      this.controller,
      this.onChanged,
      this.labelColor,
      this.labelText,
      this.hintText,
      this.validator,
      this.type = CustomFieldDateType.date});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (type == CustomFieldDateType.date) {
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
        } else {
          TimeOfDay? time = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          if (time != null) {
            final xx =
                '${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}:00';

            onSelect!.call(xx);
            if (controller != null) {
              controller!.text = xx;
            }
          } else {
            onSelect!.call("");
          }
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
                  color: labelColor ?? Theme.of(context).primaryColorDark),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
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
