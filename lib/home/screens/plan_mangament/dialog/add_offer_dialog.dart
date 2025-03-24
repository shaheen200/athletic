import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/offer_base.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/custom_dialog.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:athletic/tools/fields/custom_field_time.dart';
import 'package:athletic/tools/fields/custom_text_field_by_text.dart';
import 'package:athletic/tools/msg_dialog.dart';
import 'package:athletic/tools/waiting.dart';
import 'package:athletic/validator/field_val.dart';
import 'package:flutter/material.dart';

void addOfferDialog(BuildContext context, String planId) {
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController discount = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  customDialog(
    context: context,
    width: 0.4,
    child: Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFieldByText(
            type: CustomTextFieldByTextType.number,
            controller: discount,
            labelText: getText('price_offer'),
            validator: (p0) {
              return val(p0);
            },
          ),
          CustomFieldDate(
            onSelect: (p0) {},
            controller: startDate,
            labelText: getText('start_date_offer'),
            validator: (p0) {
              return val(p0);
            },
          ),
          CustomFieldDate(
            controller: endDate,
            onSelect: (p0) {},
            labelText: getText('end_date_offer'),
            validator: (p0) {
              return val(p0);
            },
          ),
        ],
      ),
    ),
    ok: () async {
      if (formKey.currentState!.validate()) {
        waiting(context: context);
        ApiData edit = await OfferBase.add(
            planId: planId,
            discountedPrice: discount.text,
            endDate: endDate.text,
            startDate: startDate.text);
        pOP(context);
        if (edit.success) {
          pOP(context);
          msgDialog(context1: context, state: 1, text: edit.msg);
        } else {
          msgDialog(context1: context, state: -1, text: edit.msg);
        }
      }
    },
  );
}
