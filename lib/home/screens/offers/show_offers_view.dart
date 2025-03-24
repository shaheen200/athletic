// ignore_for_file: deprecated_member_use

import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/offer_base.dart';
import 'package:athletic/home/screens/offers/dialog/edit_offer_dialog.dart';
import 'package:athletic/models/offer_model.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/Custom_Table.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/msg_dialog.dart';
import 'package:athletic/tools/pop_menu/custom_pop.dart';
import 'package:athletic/tools/waiting.dart';
import 'package:flutter/material.dart';

class ShowOffersView extends StatefulWidget {
  final ApplicationController<OfferModel> controller;
  const ShowOffersView({super.key, required this.controller});

  @override
  State<ShowOffersView> createState() => _ShowOffersViewState();
}

class _ShowOffersViewState extends State<ShowOffersView> {
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
              widget: TEXT(
                  text: widget.controller.items[index].planName,
                  size: 17,
                  bold: true)),
          CustomBodyTableItems(
              flex: 2,
              widget: TEXT(
                  text: widget.controller.items[index].originalPrice.toString(),
                  size: 17,
                  bold: true)),
          CustomBodyTableItems(
              flex: 2,
              widget: TEXT(
                  text:
                      widget.controller.items[index].discountedPrice.toString(),
                  size: 17,
                  bold: true)),
          CustomBodyTableItems(
              flex: 2,
              widget: TEXT(
                  text: widget.controller.items[index].startDate.toString(),
                  size: 17,
                  bold: true)),
          CustomBodyTableItems(
              flex: 2,
              widget: TEXT(
                  text: widget.controller.items[index].endDate.toString(),
                  size: 17,
                  bold: true)),
          CustomBodyTableItems(
              flex: 1,
              widget: CustomPop(items: [
                CustomPopItems(
                  text: getText('edit'),
                  onTap: () {
                    editOfferDialog(context, widget.controller, index);
                  },
                ),
                CustomPopItems(
                  text: getText('delete'),
                  onTap: () {
                    msgDialog(
                      context1: context,
                      state: 0,
                      text: getText('delete_msg'),
                      onClick: () async {
                        pOP(context);
                        waiting(context: context);
                        ApiData delete = await OfferBase.delete(
                            offerId:
                                widget.controller.items[index].id.toString());
                        pOP(context);
                        await msgDialog(
                            context1: context,
                            state: delete.success ? 1 : -1,
                            text: delete.msg);
                        if (delete.success) {
                          widget.controller.delete(index);
                        }
                      },
                    );
                  },
                ),
              ]))
        ]);
      },
    );
  }
}
