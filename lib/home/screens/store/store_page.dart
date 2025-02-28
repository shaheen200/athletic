import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/custom_appbar.dart';
import 'package:athletic/tools/custom_btn/customBtn.dart';
import 'package:athletic/tools/fields/custom_drop_down.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  TextEditingController count = TextEditingController();

  TextEditingController price = TextEditingController();
  TextEditingController need = TextEditingController();
  TextEditingController total = TextEditingController();
  final CustomDropDownController goods = CustomDropDownController();

  void date(de) {}

  @override
  void initState() {
    goods.equal([
      CustomDropDownItems(text: 'مياه', onTap: () {}),
      CustomDropDownItems(text: 'ببسي', onTap: () {}),
      CustomDropDownItems(text: 'شبسي', onTap: () {}),
      CustomDropDownItems(text: 'منجا', onTap: () {}),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
              CustomContainer(
                width: .4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomDropDown(
                      controller: goods,
                      labelText: getText('goods'),
                      onChanged: (p0) {},
                    ),
                    const SizedBox(height: 10),
                    CustomTextFieldByText2(
                      textWriteColor: Colors.black,
                      type: CustomTextFieldByTextType.number,
                      controller: count,
                      labelText: getText('count'),
                    ),
                    const SizedBox(height: 10),
                    CustomTextFieldByText2(
                      textWriteColor: Colors.black,
                      type: CustomTextFieldByTextType.number,
                      controller: price,
                      labelText: getText('price'),
                    ),
                    const SizedBox(height: 10),
                    CustomTextFieldByText2(
                      textWriteColor: Colors.black,
                      type: CustomTextFieldByTextType.number,
                      controller: need,
                      labelText: getText('need'),
                    ),
                    const SizedBox(height: 10),
                    CustomTextFieldByText2(
                      textWriteColor: Colors.black,
                      type: CustomTextFieldByTextType.number,
                      controller: total,
                      labelText: getText('total'),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    CustomBtn(
                      w: 1,
                      onClick: () {},
                      text: 'تأكيد',
                      textcolor: Theme.of(context).primaryColorLight,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
