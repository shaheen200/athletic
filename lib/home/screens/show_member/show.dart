import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/database/member_base.dart';
import 'package:athletic/home/screens/show_member/show_member_view.dart';
import 'package:athletic/models/client_models.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/Custom_Table.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_appbar.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:flutter/material.dart';

enum ShowMemeberState { active, notActive }

class ShowMember extends StatelessWidget {
  final ShowMemeberState state;
  const ShowMember({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final ApplicationController<ClientModels> controller =
        ApplicationController<ClientModels>();
    return FutureBuilder(
      future: MemberBase.get(state: state),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (!snapshot.data!.success) {
          return Center(
            child: TEXT(text: snapshot.data!.msg, size: 18, bold: true),
          );
        } else {
          controller.equal(snapshot.data!.data);
          return Column(
            children: [
              const CustomAppbar(),
              Padding(
                padding: const EdgeInsets.only(right: 40),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TEXT(
                    text: state == ShowMemeberState.active
                        ? getText('Active Members')
                        : getText('renew'),
                    size: 32,
                    bold: true,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              Expanded(
                child: CustomContainer(
                  width: 1,
                  margin: 40,
                  color: Theme.of(context).primaryColor.withOpacity(0.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: TEXT(
                          text: getText('Gym Members'),
                          size: 20,
                          bold: true,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: Row(
                          children: [
                            Expanded(
                              child: CustomTextFieldByText2(
                                hintText: getText(
                                  'search',
                                ),
                                color: Theme.of(context).primaryColor,
                                onChanged: (p0) {
                                  controller.search(p0, (p1) => p1.userName);
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Icon(
                              Icons.search_outlined,
                              color: Theme.of(context).primaryColorLight,
                              size: 30,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomHeadTable(headData: [
                        CustomHeadTableItems(flex: 2, text: getText('email')),
                        CustomHeadTableItems(flex: 2, text: getText('name')),
                        CustomHeadTableItems(flex: 2, text: getText('phone')),
                        CustomHeadTableItems(
                            flex: 2, text: getText('Date Enrolled')),
                        CustomHeadTableItems(
                            flex: 2, text: getText('Date Expiration')),
                        CustomHeadTableItems(flex: 1, text: getText('more')),
                      ]),
                      Expanded(
                          child: ShowMemberView(
                        controller: controller,
                        state: state,
                      ))
                    ],
                  ),
                ),
              )
            ],
          );
        }
      },
    );
  }
}
