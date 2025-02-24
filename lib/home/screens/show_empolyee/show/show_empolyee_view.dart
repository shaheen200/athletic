import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/Custom_Table.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/pop_menu/custom_pop.dart';
import 'package:flutter/material.dart';

class ShowEmpolyeeView extends StatefulWidget {
  final ApplicationController controller;
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
      itemCount: 1,
      itemBuilder: (context, index) {
        return CustomBodyTable(
          headData: [
            CustomBodyTableItems(
                flex: 1, widget: const TEXT(text: 'aaaa', size: 17)),
            CustomBodyTableItems(
                flex: 1, widget: const TEXT(text: 'aaaa', size: 17)),
            CustomBodyTableItems(
                flex: 1, widget: const TEXT(text: 'aaaa', size: 17)),
            CustomBodyTableItems(
                flex: 1, widget: const TEXT(text: 'aaaa', size: 17)),
            CustomBodyTableItems(
              flex: 1,
              widget: CustomPop(
                items: [
                  CustomPopItems(
                    text: getText('edit'),
                  ),
                  CustomPopItems(
                    text: getText('stop'),
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
