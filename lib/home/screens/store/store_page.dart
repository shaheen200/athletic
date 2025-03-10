import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/order_base.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_appbar.dart';
import 'package:athletic/tools/custom_btn/customBtn.dart';
import 'package:athletic/tools/fields/custom_drop_down.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:athletic/tools/msg_dialog.dart';
import 'package:athletic/tools/waiting.dart';
import 'package:athletic/validator/field_val.dart';
import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  TextEditingController count = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController price = TextEditingController();
  TextEditingController need = TextEditingController();
  TextEditingController total = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final CustomDropDownController goods = CustomDropDownController();
    return FutureBuilder(
      future: OrderBase.getAllProduct(),
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
          goods.equal(snapshot.data!.data.map((e) {
            return CustomDropDownItems(
                text: e.name,
                value: e.id.toString(),
                onTap: () {
                  price.text = e.price.toString();
                  count.text = e.count.toString();
                });
          }).toList());
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppbar(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Form(
                      key: formKey,
                      child: CustomContainer(
                        width: .4,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomDropDown(
                              controller: goods,
                              labelText: getText('goods'),
                              validator: (p0) {
                                return val(p0);
                              },
                              onChanged: (p0) {},
                            ),
                            const SizedBox(height: 10),
                            CustomTextFieldByText2(
                              textWriteColor: Colors.black,
                              type: CustomTextFieldByTextType.number,
                              controller: count,
                              enable: false,
                              labelText: getText('count'),
                              validator: (p0) {
                                return val(p0);
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomTextFieldByText2(
                              textWriteColor: Colors.black,
                              type: CustomTextFieldByTextType.number,
                              controller: price,
                              labelText: getText('price'),
                              validator: (p0) {
                                return val(p0);
                              },
                              enable: false,
                            ),
                            const SizedBox(height: 10),
                            CustomTextFieldByText2(
                              textWriteColor: Colors.black,
                              type: CustomTextFieldByTextType.number,
                              controller: need,
                              labelText: getText('need'),
                              onChanged: (p0) {},
                              validator: (p0) {
                                return val(p0);
                              },
                              onFieldSubmitted: (p0) {
                                if (double.parse(p0) <=
                                    double.parse(count.text)) {
                                  total.text = (double.parse(p0) *
                                          double.parse(price.text))
                                      .toStringAsFixed(1);
                                } else {
                                  msgDialog(
                                      context1: context,
                                      state: -1,
                                      text: 'الكمية المطلوبة كبيرة');
                                }
                              },
                            ),
                            const SizedBox(height: 10),
                            CustomTextFieldByText2(
                              textWriteColor: Colors.black,
                              type: CustomTextFieldByTextType.number,
                              controller: total,
                              labelText: getText('total'),
                              validator: (p0) {
                                return val(p0);
                              },
                              enable: false,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            CustomBtn(
                              w: 1,
                              onClick: () {
                                if (formKey.currentState!.validate()) {
                                  msgDialog(
                                    context1: context,
                                    state: 0,
                                    text: getText('add_msg'),
                                    onClick: () async {
                                      pOP(context);
                                      waiting(context: context);
                                      ApiData add = await OrderBase.add(
                                          goodId: goods.value!,
                                          count: need.text);
                                      pOP(context);
                                      await msgDialog(
                                          context1: context,
                                          state: add.success ? 1 : -1,
                                          text: add.msg);
                                      if (add.success) {
                                        count.clear();
                                        need.clear();
                                        total.clear();
                                        price.clear();
                                        setState(() {});
                                      }
                                    },
                                  );
                                }
                              },
                              text: 'تأكيد',
                              textcolor: Theme.of(context).primaryColorLight,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
