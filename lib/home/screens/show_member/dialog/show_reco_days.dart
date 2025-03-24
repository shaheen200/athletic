import 'package:athletic/database/member_base.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/Custom_Table.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_dialog.dart';
import 'package:flutter/material.dart';

showRecoDays(BuildContext context, {required String userCode}) async {
  customDialog(
      context: context,
      width: 0.7,
      child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.7,
          child: FutureBuilder(
            future: MemberBase.getRecoDay(userCode: userCode),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!snapshot.data!.success) {
                return Center(
                  child: TEXT(
                    text: snapshot.data!.msg,
                    size: 18,
                    bold: true,
                    color: Colors.white,
                  ),
                );
              } else {
                return Column(
                  children: [
                    CustomHeadTable(headData: [
                      CustomHeadTableItems(flex: 1, text: getText('number')),
                      CustomHeadTableItems(flex: 2, text: getText('date')),
                      CustomHeadTableItems(flex: 2, text: getText('time')),
                    ]),
                    Expanded(
                        child: ListView.builder(
                      itemCount: snapshot.data!.data.length,
                      itemBuilder: (context, index) {
                        return CustomBodyTable(
                          headData: [
                            CustomBodyTableItems(
                                flex: 1,
                                widget: TEXT(text: '${index + 1}', size: 17)),
                            CustomBodyTableItems(
                                flex: 2,
                                widget: TEXT(
                                    text: snapshot
                                        .data!.data[index].attendanceDate
                                        .split('T')[0],
                                    size: 17)),
                            CustomBodyTableItems(
                                flex: 2,
                                widget: TEXT(
                                    text: snapshot
                                        .data!.data[index].attendanceDate
                                        .split('T')[1],
                                    size: 17)),
                          ],
                        );
                      },
                    ))
                  ],
                );
              }
            },
          )));
}
