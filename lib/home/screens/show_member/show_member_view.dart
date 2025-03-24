import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/member_base.dart';
import 'package:athletic/home/screens/show_member/dialog/show_reco_days.dart';
import 'package:athletic/home/screens/show_member/dialog/update_member.dart';
import 'package:athletic/home/screens/show_member/show.dart';
import 'package:athletic/models/client_models.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/Custom_Table.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/msg_dialog.dart';
import 'package:athletic/tools/pop_menu/custom_pop.dart';
import 'package:athletic/tools/waiting.dart';
import 'package:flutter/material.dart';

import 'dialog/renew_memeber_subsrip.dart';

class ShowMemberView extends StatefulWidget {
  final ApplicationController<ClientModels> controller;
  final ShowMemeberState state;
  const ShowMemberView(
      {super.key, required this.controller, required this.state});

  @override
  State<ShowMemberView> createState() => _ShowMemberViewState();
}

class _ShowMemberViewState extends State<ShowMemberView> {
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
      itemCount: widget.controller.items.length,
      itemBuilder: (context, index) {
        return CustomBodyTable(
          headData: [
            CustomBodyTableItems(
                flex: 2,
                widget: TEXT(
                    text: widget.controller.items[index].userEmail, size: 17)),
            CustomBodyTableItems(
                flex: 2,
                widget: TEXT(
                    text: widget.controller.items[index].userName, size: 17)),
            CustomBodyTableItems(
                flex: 2,
                widget: TEXT(
                    text: widget.controller.items[index].phoneNumber,
                    size: 17)),
            CustomBodyTableItems(
                flex: 2,
                widget: TEXT(
                    text: widget.controller.items[index].startDate, size: 17)),
            CustomBodyTableItems(
                flex: 2,
                widget: TEXT(
                    text: widget.controller.items[index].endDate, size: 17)),
            CustomBodyTableItems(
              flex: 1,
              widget: CustomPop(
                items: [
                  CustomPopItems(
                    show: widget.state == ShowMemeberState.active,
                    text: getText('reco_day'),
                    onTap: () async {
                      waiting(context: context);
                      ApiData reco = await MemberBase.recoDay(
                          userCode: widget.controller.items[index].userCode);
                      pOP(context);
                      msgDialog(
                          context1: context,
                          state: reco.success ? 1 : -1,
                          text: reco.msg);
                    },
                  ),
                  CustomPopItems(
                    show: widget.state == ShowMemeberState.active,
                    text: getText('history_days'),
                    onTap: () {
                      showRecoDays(context,
                          userCode: widget.controller.items[index].userCode);
                    },
                  ),
                  // CustomPopItems(
                  //   text: getText('history_subscrip'),
                  // ),
                  CustomPopItems(
                    show: widget.state == ShowMemeberState.active,
                    text: getText('edit'),
                    onTap: () {
                      editMemeberDays(context,
                          controller: widget.controller, index: index);
                    },
                  ),
                  CustomPopItems(
                    show: widget.state == ShowMemeberState.notActive,
                    text: getText('renew'),
                    onTap: () {
                      renewMemeberPlans(context,
                          controller: widget.controller, index: index);
                    },
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
