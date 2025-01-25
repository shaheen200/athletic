// ignore_for_file: empty_catches

import 'package:flutter/material.dart';
import '../../method/number_only.dart';
import '../customText.dart';

class CustomTextFieldByText extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final IconData? icon;
  final bool enable;
  final bool numberOnly;
  final bool pw;
  final int? maxLines;
  final bool writeCenter;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  const CustomTextFieldByText(
      {super.key,
      this.controller,
      this.maxLines = 1,
      this.onChanged,
      this.numberOnly = false,
      this.enable = true,
      this.pw = false,
      this.labelText,
      this.hintText,
        this.icon,
      this.writeCenter = false,
      this.onFieldSubmitted,
      this.validator});

  @override
  State<CustomTextFieldByText> createState() => _CustomTextFieldByTextState();
}

class _CustomTextFieldByTextState extends State<CustomTextFieldByText> {
  bool show = false;
  @override
  void initState() {
    show = widget.pw;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    InputBorder border = OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide:
            BorderSide(color: Theme.of(context).primaryColor, width: 3));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: widget.labelText == null ? false : true,
          child: TEXT(
              text: " ${widget.labelText} ",
              size: 20,
              bold: true,
              color: Theme.of(context).primaryColor),
        ),
        Visibility(
          visible: widget.labelText == null ? false : true,
          child: const SizedBox(height: 6),
        ),
        TextFormField(
          onFieldSubmitted: widget.onFieldSubmitted,
          obscureText: show,
          style: TextStyle(color: Theme.of(context).primaryColor),
          maxLines: widget.maxLines,
          enabled: widget.enable,
          onChanged: (value) {
            try {
              if (value.isNotEmpty) {
                if (widget.numberOnly) {
                  if (numberOnly(text: value)) {
                    widget.onChanged!.call(value);
                  } else {
                    widget.controller!.text =
                        widget.controller!.text.substring(0, value.length - 1);
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
          textAlign: widget.writeCenter ? TextAlign.center : TextAlign.start,
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
              contentPadding: const EdgeInsets.only(left: 15, right: 15),
              errorBorder: border,
              enabledBorder: border,
              focusedBorder: border,
              disabledBorder: border,
              focusedErrorBorder: border,
              border: border),
        ),
      ],
    );
  }
}
