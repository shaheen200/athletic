import 'package:athletic/tools/customText.dart';
import 'package:flutter/material.dart';

class Custom_drop_down extends StatefulWidget {
  final List items;
  final String title;

  Custom_drop_down({Key? key, required this.items, required this.title})
      : super(key: key);  

  @override
  State<Custom_drop_down> createState() => _Custom_drop_downState();
}

class _Custom_drop_downState extends State<Custom_drop_down> {
  dynamic dropdownValue;  

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.items.isNotEmpty
        ? widget.items[0]
        : null;  
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TEXT(
          text: widget.title,
          size: 18,
          bold: true,
          color: Theme.of(context).primaryColor,
        ),  
        SizedBox(height: 10,),
        Container(
          width: 100,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Theme.of(context).primaryColor, width: 3),
          ),
          child: Center(
            child: DropdownButton<dynamic>(
              value: dropdownValue,
              onChanged: (newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: widget.items.map<DropdownMenuItem<dynamic>>((value) {
                return DropdownMenuItem<dynamic>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(fontSize: 18, color: Colors.black),
                  ),
                );
              }).toList(),
              dropdownColor: Colors.white,
              style: const TextStyle(color: Colors.blue, fontSize: 18),
              icon: const Icon(
                Icons.keyboard_arrow_down_outlined,
                color: Colors.black,
              ),
              underline: const SizedBox(),
            ),
          ),
        ),
      ],
    );
  }
}
