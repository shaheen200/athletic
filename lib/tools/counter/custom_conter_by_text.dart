import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:flutter/material.dart';

class CustomConterByText extends StatefulWidget {
  final String? labelText;
  final int value;
  final int start;
  final int max;
  final void Function(int)? onChanged;
  const CustomConterByText(
      {super.key,
      this.onChanged,
      this.max = 100,
      this.start = 1,
      this.value = 1,
      this.labelText});

  @override
  State<CustomConterByText> createState() => _CustomConterByTextState();
}

class _CustomConterByTextState extends State<CustomConterByText> {
  int value = 0;
  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.labelText != null,
            child: TEXT(
                text: " ${widget.labelText} ",
                size: 20,
                bold: true,
                color: Theme.of(context).primaryColorDark),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 6),
            child: CustomContainer(
              width: 1,
              pading: 5,
              margin: 0,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  GestureDetector(
                      onTap: () {
                        if (value > widget.start) {
                          setState(() {
                            value -= 1;
                            if (widget.onChanged != null) {
                              widget.onChanged!(value);
                            }
                          });
                        }
                      },
                      child: TEXT(
                          text: "-",
                          size: 26,
                          bold: true,
                          color: Theme.of(context).primaryColorDark)),
                  Expanded(
                      child: Center(
                    child: TEXT(text: value.toString(), size: 22, bold: true),
                  )),
                  GestureDetector(
                      onTap: () {
                        if (value < widget.max) {
                          setState(() {
                            value += 1;
                            if (widget.onChanged != null) {
                              widget.onChanged!(value);
                            }
                          });
                        }
                      },
                      child: TEXT(
                          text: "+",
                          size: 26,
                          bold: true,
                          color: Theme.of(context).primaryColorDark)),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
