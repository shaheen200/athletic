import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_appbar.dart';
import 'package:athletic/tools/custom_btn/customBtn.dart';
  import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:flutter/material.dart';

class Show_Coaches extends StatelessWidget {
  const Show_Coaches({super.key});

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
              text: getText('Active Coaches'),
              size: 32,
              bold: true,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 60, bottom: 10),
            child: CustomBtn(
              onClick: () {},
              text: getText('Add Coach'),
              
              textcolor:   Theme.of(context).primaryColor,
              btnColor: Theme.of(context).primaryColorLight,
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
                    text: getText('Manage Coaches'),
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
                      text: getText('phone'),
                      size: 18,
                      color: Theme.of(context).hintColor,
                    ),
                    TEXT(
                      text: getText('Gender'),
                      size: 18,
                      color: Theme.of(context).hintColor,
                    ),
                    TEXT(
                      text: getText('Salary'),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TEXT(
                        text: "Ahmed",
                        size: 16,
                        color: Theme.of(context).primaryColorLight,
                      ),
                      TEXT(
                          text: "0107867467698",
                          size: 16,
                          color: Theme.of(context).primaryColorLight),
                      TEXT(
                          text: "male",
                          size: 16,
                          color: Theme.of(context).primaryColorLight),
                      TEXT(
                          text: "3500",
                          size: 16,
                          color: Theme.of(context).primaryColorLight),
                      CustomBtn(
                        onClick: () {},
                        text: getText("Edit"),
                        textcolor: Theme.of(context).primaryColorDark,
                        btnColor: Theme.of(context).primaryColorLight,
                        w: .08,
                      )
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
