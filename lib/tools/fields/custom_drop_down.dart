import 'package:athletic/tools/customText.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatefulWidget {
  final String? labelText;
  final void Function(dynamic)? onChanged;
  final void Function(CustomDropDownItems)? onChangedItems;
  final String? Function(String?)? validator;
  final double margin;
  final String? hintText;
  final CustomDropDownController controller;
  final bool showClear;
  final String? value;
  final void Function()? afterClear;
  final Color? color;
  const CustomDropDown({
    super.key,
    required this.controller,
    required this.onChanged,
    this.validator,
    this.margin = 5,
    this.hintText,
    this.labelText,
    this.showClear = false,
    this.afterClear,
    this.value,
    this.onChangedItems,
    this.color,
  });

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
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
              color: widget.color ?? Colors.black,
            ),
          ),
          Visibility(
            visible: widget.labelText != null,
            child: const SizedBox(height: 6),
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: widget.color ?? Colors.black12),
            child: Row(
              children: [
                const SizedBox(width: 10),
                Expanded(
                  child: DropdownButtonFormField(
                    iconEnabledColor: Theme.of(context).primaryColorDark,
                    iconDisabledColor: Theme.of(context).primaryColorDark,
                    validator: widget.validator,
                    value: widget.value ?? widget.controller.value,
                    dropdownColor: Theme.of(context).primaryColorLight,
                    style: TextStyle(color: Theme.of(context).primaryColor),
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.only(left: 5, right: 5),
                    ),
                    items: widget.controller.items
                        .where((element) => element.text.isNotEmpty)
                        .map((e) {
                      return DropdownMenuItem(
                        value: e.value ?? e.text,
                        onTap: () async {
                          if (e.onTap != null) {
                            e.onTap!();
                          }
                          widget.controller.setText(e.text);
                        },
                        child: TEXT(
                          text: e.text,
                          size: 17,
                          color: Theme.of(context).primaryColorDark,
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      widget.controller.setValue("$value");
                      widget.onChanged?.call(value);
                      // Clear selection if necessary
                      if (widget.controller.value == null ||
                          widget.controller.value!.isEmpty) {
                        widget.controller.clear();
                      }
                      if (widget.onChangedItems != null) {
                        widget.onChangedItems!.call(CustomDropDownItems(
                            text: widget.controller.text.toString(),
                            value: value.toString(),
                            onTap: () {}));
                      }
                    },
                  ),
                ),
                const SizedBox(width: 10),
                Visibility(
                  visible: widget.showClear,
                  child: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        widget.controller.clear();
                      });
                      if (widget.afterClear != null) {
                        widget.afterClear!();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomDropDownItems {
  final String text;
  final String? value;
  final void Function()? onTap;

  CustomDropDownItems({required this.text, required this.onTap, this.value});
}

class CustomDropDownController extends ChangeNotifier {
  List<CustomDropDownItems> items = [];
  List<CustomDropDownItems> _items = [];
  String? initValue;
  String? value;
  String? text;

  void setInit(String value) {
    initValue = value;
    this.value = value;
    notifyListeners();
  }

  void setValue(String value) {
    this.value = value;
    notifyListeners();
  }

  void setText(String value) {
    text = value;
  }

  void add(CustomDropDownItems item) {
    items.add(item);
    _items = items;
    notifyListeners();
  }

  void equal(List<CustomDropDownItems> list) {
    initValue = null;
    value = null;
    text = null;
    items = list;
    _items = items;
    notifyListeners();
  }

  void edit(CustomDropDownItems item, int index) {
    initValue = null;
    value = null;
    if (items.isNotEmpty) {
      items[index] = item;
      _items = items;
      items = _items.where((element) => element.text.isNotEmpty).toList();
    } else {
      items.add(item);
      _items = items;
      items = _items.where((element) => element.text.isNotEmpty).toList();
    }
    notifyListeners();
  }

  void delete(String value) {
    items.removeWhere((element) => element.text == value);
    _items = items;
    notifyListeners();
  }

  void deleteIndex(int index) {
    initValue = null;
    value = null;
    items.removeAt(index);
    _items = items;
    notifyListeners();
  }

  void clear() {
    value = null;
    initValue = null;
    text = null;
    notifyListeners();
  }

  void search(String p0) {
    initValue = null;
    value = null;
    items = _items.where((element) => element.text.contains(p0)).toList();
    notifyListeners();
  }
}
