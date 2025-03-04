import 'package:athletic/database/equipment_base.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/Custom_Table.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_dialog.dart';
import 'package:flutter/material.dart';

showfixEquipmentDialog({required BuildContext context, required int id}) {
  customDialog(
    context: context,
    width: 0.7,
    child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        height: MediaQuery.of(context).size.height * 0.7,
        child: FutureBuilder(
          future: EquipmentBase.getRepairByEquipmentId(id),
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
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomHeadTable(headData: [
                    CustomHeadTableItems(flex: 1, text: getText('num')),
                    CustomHeadTableItems(flex: 2, text: getText('price')),
                    CustomHeadTableItems(flex: 5, text: getText('note')),
                    CustomHeadTableItems(flex: 2, text: getText('time')),
                  ]),
                  Expanded(
                      child: ListView.builder(
                    itemCount: snapshot.data!.data.length,
                    itemBuilder: (context, index) {
                      return CustomBodyTable(headData: [
                        CustomBodyTableItems(
                            flex: 1,
                            widget: TEXT(
                                text: "${index + 1}", size: 17, bold: true)),
                        CustomBodyTableItems(
                            flex: 2,
                            widget: TEXT(
                                text: '${snapshot.data!.data[index].cost}',
                                size: 17,
                                bold: true)),
                        CustomBodyTableItems(
                            flex: 5,
                            widget: TEXT(
                                text: snapshot.data!.data[index].description,
                                size: 17,
                                bold: true)),
                        CustomBodyTableItems(
                            flex: 2,
                            widget: TEXT(
                                text: snapshot.data!.data[index].time,
                                size: 17,
                                bold: true)),
                      ]);
                    },
                  ))
                ],
              );
            }
          },
        )),
  );
}
