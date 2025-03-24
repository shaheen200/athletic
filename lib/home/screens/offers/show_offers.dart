import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/database/offer_base.dart';
import 'package:athletic/home/screens/offers/show_offers_view.dart';
import 'package:athletic/models/offer_model.dart';
import 'package:athletic/provider/language/get_text.dart';
import 'package:athletic/tools/Custom_Table.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:flutter/material.dart';

class ShowOffers extends StatefulWidget {
  const ShowOffers({super.key});

  @override
  State<ShowOffers> createState() => _ShowOffersState();
}

class _ShowOffersState extends State<ShowOffers> {
  @override
  Widget build(BuildContext context) {
    ApplicationController<OfferModel> controller =
        ApplicationController<OfferModel>();
    return FutureBuilder(
      future: OfferBase.getAlloffer(),
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
          controller.equal(snapshot.data!.data);
          return CustomContainer(
            margin: 20,
            width: 1,
            pading: 20,
            color: const Color(0xffF4DCAC),
            child: Column(
              children: [
                CustomHeadTable(headData: [
                  CustomHeadTableItems(flex: 1, text: getText('num')),
                  CustomHeadTableItems(flex: 3, text: getText('name')),
                  CustomHeadTableItems(flex: 2, text: getText('price_plan')),
                  CustomHeadTableItems(flex: 2, text: getText('price_offer')),
                  CustomHeadTableItems(
                      flex: 2, text: getText('start_date_offer')),
                  CustomHeadTableItems(
                      flex: 2, text: getText('end_date_offer')),
                  CustomHeadTableItems(flex: 1, text: getText('more')),
                ]),
                const SizedBox(height: 10),
                Expanded(child: ShowOffersView(controller: controller))
              ],
            ),
          );
        }
      },
    );
  }
}
