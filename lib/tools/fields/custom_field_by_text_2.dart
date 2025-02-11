// ignore_for_file: empty_catches

import 'package:flutter/material.dart';
import '../../method/number_only.dart';
import '../customText.dart';

enum CustomTextFieldByTextType { date, text, number }

class CustomTextFieldByText2 extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final IconData? icon;
  final bool enable;
  final bool pw;
  final CustomTextFieldByTextType type;
  final int? maxLines;
  final bool writeCenter;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final Color? color;
  const CustomTextFieldByText2(
      {super.key,
      this.controller,
      this.maxLines = 1,
      this.onChanged,
      this.enable = true,
      this.pw = false,
      this.labelText,
      this.hintText,
      this.icon,
      this.writeCenter = false,
      this.onFieldSubmitted,
      this.validator,
      this.color,
      this.type = CustomTextFieldByTextType.text});

  @override
  State<CustomTextFieldByText2> createState() => _CustomTextFieldByText2State();
}

class _CustomTextFieldByText2State extends State<CustomTextFieldByText2> {
  bool show = false;
  @override
  void initState() {
    show = widget.pw;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.labelText == null ? false : true,
          child: TEXT(
              text: " ${widget.labelText} ",
              size: 20,
              bold: true,
              color: widget.color ?? Colors.black),
        ),
        Visibility(
          visible: widget.labelText == null ? false : true,
          child: const SizedBox(height: 6),
        ),
        GestureDetector(
          onTap: () async {
            if (widget.type == CustomTextFieldByTextType.date) {
              DateTime? time = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2024),
                  lastDate: DateTime(2100));
              if (time != null) {
                widget.onChanged!.call(time.toString().split(' ')[0]);
              }
            }
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: widget.color ?? Colors.black12),
            child: TextFormField(
              onFieldSubmitted: widget.onFieldSubmitted,
              obscureText: show,
              style: const TextStyle(color: Colors.white,fontSize: 18),
              maxLines: widget.maxLines,
              enabled: widget.type == CustomTextFieldByTextType.date
                  ? false
                  : widget.enable,
              onChanged: (value) {
                try {
                  if (value.isNotEmpty) {
                    if (widget.type == CustomTextFieldByTextType.number) {
                      if (numberOnly(text: value)) {
                        widget.onChanged!.call(value);
                      } else {
                        widget.controller!.text = widget.controller!.text
                            .substring(0, value.length - 1);
                      }
                    } else {
                      widget.onChanged!.call(value);
                    }
                  } else {
                    widget.onChanged!.call(value);
                  }
                } catch (e) {}
              },
              controller: widget.controller,
              validator: widget.validator,
              textAlign:
                  widget.writeCenter ? TextAlign.center : TextAlign.start,
              decoration: InputDecoration(
                  suffixIcon: Visibility(
                      visible: widget.pw,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            show = !show;
                          });
                        },
                        icon: Icon(
                          show
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_off_outlined,
                          color: Theme.of(context).primaryColor,
                        ),
                      )),
                  hintText: widget.hintText,
                  
                  hintStyle: TextStyle(color: Theme.of(context).primaryColorLight,fontSize: 18,),
                  contentPadding: const EdgeInsets.only(left: 15, right: 30),
                  border: _border,
                  errorBorder: _border,
                  enabledBorder: _border,
                  focusedBorder: _border,
                  disabledBorder: _border,
                  focusedErrorBorder: _border),
            ),
          ),
        ),
      ],
    );
  }
}

final _border = OutlineInputBorder(
    borderRadius: BorderRadius.circular(10),
    borderSide: const BorderSide(
      color: Colors.transparent,
    ));
