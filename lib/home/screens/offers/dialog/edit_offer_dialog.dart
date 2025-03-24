import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/database/api_data.dart';
import 'package:athletic/database/offer_base.dart';
import 'package:athletic/models/offer_model.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/custom_dialog.dart';
import 'package:athletic/tools/fields/custom_field_by_text_2.dart';
import 'package:athletic/tools/fields/custom_field_time.dart';
import 'package:athletic/tools/fields/custom_text_field_by_text.dart';
import 'package:athletic/tools/msg_dialog.dart';
import 'package:athletic/tools/waiting.dart';
import 'package:athletic/validator/field_val.dart';
import 'package:flutter/material.dart';

void editOfferDialog(BuildContext context,
    ApplicationController<OfferModel> controller, int index) {
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController discount = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  startDate.text = controller.items[index].startDate.toString();
  endDate.text = controller.items[index].endDate.toString();
  discount.text = controller.items[index].discountedPrice.toString();

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
        ApiData edit = await OfferBase.updatePlanById(
            planId: controller.items[index].planId.toString(),
            discountedPrice: controller.items[index].discountedPrice.toString(),
            endDate: controller.items[index].endDate.toString(),
            offerId: controller.items[index].id,
            startDate: controller.items[index].startDate.toString());
        pOP(context);
        if (edit.success) {
          pOP(context);
          await msgDialog(context1: context, state: 1, text: edit.msg);
          controller.editItem(
            OfferModel.fromMap(edit.data),
            (p0, p1) {
              return p0.id == p1.id;
            },
          );
        } else {
          msgDialog(context1: context, state: -1, text: edit.msg);
        }
      }
    },
  );
}
