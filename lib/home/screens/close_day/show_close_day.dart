import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/database/close_day_base.dart';
import 'package:athletic/home/screens/close_day/show_close_day_view.dart';
import 'package:athletic/models/close_day_model.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/Custom_Table.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_btn/customBtn.dart';
import 'package:athletic/tools/fields/custom_field_time.dart';
import 'package:flutter/material.dart';

class ShowCloseDay extends StatefulWidget {
  const ShowCloseDay({super.key});

  @override
  State<ShowCloseDay> createState() => _ShowCloseDayState();
}

class _ShowCloseDayState extends State<ShowCloseDay> {
  final TextEditingController startDate = TextEditingController();
  final TextEditingController endDate = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    startDate.text = DateTime.now()
        .subtract(const Duration(days: 1))
        .toString()
        .split(' ')[0];
    endDate.text = DateTime.now().toString().split(' ')[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ApplicationController<Transaction> controller =
        ApplicationController<Transaction>();
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Form(
            key: formKey,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: CustomFieldDate(
                      labelColor: Colors.white,
                      labelText: getText('start_time'),
                      onSelect: (p0) {},
                      controller: startDate,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: CustomFieldDate(
                      labelColor: Colors.white,
                      labelText: getText('end_time'),
                      onSelect: (p0) {},
                      controller: endDate,
                    ),
                  ),
                  CustomBtn(
                      onClick: () {
                        if (formKey.currentState!.validate()) {
                          setState(() {});
                        }
                      },
                      text: getText('search'),
                      w: 0.1)
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: FutureBuilder(
              future: CloseDayBase.get(
                  endDate: endDate.text, startDate: startDate.text),
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
                  controller.equal(snapshot.data!.data!.transactions);
                  return CustomContainer(
                    width: 1,
                    pading: 20,
                    color: const Color(0xffF4DCAC),
                    child: Column(
                      children: [
                        CustomHeadTable(headData: [
                          CustomHeadTableItems(flex: 1, text: getText('num')),
                          CustomHeadTableItems(
                              flex: 2, text: getText('TransactionType')),
                          CustomHeadTableItems(flex: 2, text: getText('money')),
                          CustomHeadTableItems(
                              flex: 2, text: getText('TransactionDate')),
                          CustomHeadTableItems(
                              flex: 4, text: getText('Description')),
                        ]),
                        const SizedBox(height: 10),
                        Expanded(
                            child: ShowCloseDayView(controller: controller)),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TEXT(
                                text:
                                    'الصافي اليومي : ${snapshot.data!.data!.netAmount}',
                                size: 19,
                                bold: true),
                            TEXT(
                                text:
                                    'المصروفات : ${snapshot.data!.data!.totalExpenses}',
                                size: 19,
                                bold: true),
                          ],
                        )
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
