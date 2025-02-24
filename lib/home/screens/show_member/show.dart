import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/home/screens/show_member/show_member_view.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/Custom_Table.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_appbar.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:flutter/material.dart';

class ShowMember extends StatelessWidget {
  const ShowMember({super.key});

  @override
  Widget build(BuildContext context) {
    final ApplicationController controller = ApplicationController();
    return Column(
      children: [
        const CustomAppbar(),
        Padding(
          padding: const EdgeInsets.only(right: 40),
          child: Align(
            alignment: Alignment.topRight,
            child: TEXT(
              text: getText('Active Members'),
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
                  CustomHeadTableItems(flex: 1, text: getText('name')),
                  CustomHeadTableItems(flex: 1, text: getText('code')),
                  CustomHeadTableItems(flex: 1, text: getText('Date Enrolled')),
                  CustomHeadTableItems(
                      flex: 1, text: getText('Date Expiration')),
                  CustomHeadTableItems(flex: 1, text: getText('more')),
                ]),
                Expanded(child: ShowMemberView(controller: controller))
              ],
            ),
          ),
        )
      ],
    );
  }
}
