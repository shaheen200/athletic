import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/Custom_Table.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_appbar.dart';
import 'package:athletic/tools/custom_btn/customBtn.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:flutter/material.dart';

class Show_Member extends StatelessWidget {
  const Show_Member({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar(),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 60, bottom: 10),
            child: TEXT(
              text: getText('Active Members'),
              size: 32,
              bold: true,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        CustomContainer(
          width: .7,
          height: .6,
          color: Theme.of(context).primaryColor.withOpacity(0.5),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
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
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 160,
                      child: CustomTextFieldByText2(
                        hintText: getText(
                          'search',
                        ),
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.search_outlined,
                      color: Theme.of(context).primaryColorLight,
                      size: 30,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TEXT(
                      text: getText('name'),
                      size: 18,
                      color: Theme.of(context).hintColor,
                    ),
                    TEXT(
                      text: getText('Member ID'),
                      size: 18,
                      color: Theme.of(context).hintColor,
                    ),
                    TEXT(
                      text: getText('Date Enrolled'),
                      size: 18,
                      color: Theme.of(context).hintColor,
                    ),
                    TEXT(
                      text: getText('Date Expiration'),
                      size: 18,
                      color: Theme.of(context).hintColor,
                    ),
                    TEXT(
                      text: getText('Actions'),
                      size: 18,
                      color: Theme.of(context).hintColor,
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: CustomHeadTable(
                    headData: [
                      CustomHeadTableItems(flex: 0, text: ('Ahmed Elkholy')),
                      CustomHeadTableItems(flex: 2, text: (' 835')),
                      CustomHeadTableItems(flex: 2, text: ('3/5/2025')),
                      CustomHeadTableItems(flex: 2, text: ('5/6/7777')),
                      CustomHeadTableItems(flex: 0, text: getText('Actions')),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
