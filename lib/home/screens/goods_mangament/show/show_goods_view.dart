import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/Custom_Table.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/msg_dialog.dart';
import 'package:athletic/tools/pop_menu/custom_pop.dart';
import 'package:flutter/material.dart';

class ShowGoodsView extends StatefulWidget {
  final ApplicationController controller;
  const ShowGoodsView({super.key, required this.controller});

  @override
  State<ShowGoodsView> createState() => _ShowGoodsViewState();
}

class _ShowGoodsViewState extends State<ShowGoodsView> {
  @override
  void initState() {
    widget.controller.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.controller.items.length,
      itemBuilder: (context, index) {
        return CustomBodyTable(headData: [
          CustomBodyTableItems(
              flex: 1,
              widget: TEXT(text: "${index + 1}", size: 17, bold: true)),
          CustomBodyTableItems(
              flex: 3,
              widget: const TEXT(text: 'aaaaaa', size: 17, bold: true)),
          CustomBodyTableItems(
              flex: 2,
              widget: const TEXT(text: 'aaaaaa', size: 17, bold: true)),
          CustomBodyTableItems(
              flex: 2,
              widget: const TEXT(text: 'aaaaaa', size: 17, bold: true)),
          CustomBodyTableItems(
              flex: 2,
              widget: const TEXT(text: 'aaaaaa', size: 17, bold: true)),
          CustomBodyTableItems(
              flex: 1,
              widget: CustomPop(items: [
                CustomPopItems(
                  text: getText('edit'),
                  onTap: () {},
                ),
                CustomPopItems(
                  text: getText('fix'),
                  onTap: () {},
                ),
                CustomPopItems(
                  text: getText('delete'),
                  onTap: () {
                    msgDialog(
                        context1: context,
                        state: 0,
                        text: getText('delete_msg'),
                        onClick: () {
                          widget.controller.delete(index);
                        });
                  },
                )
              ]))
        ]);
      },
    );
  }
}
