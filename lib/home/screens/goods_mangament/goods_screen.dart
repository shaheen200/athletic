import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/database/goods_base.dart';
import 'package:athletic/home/screens/goods_mangament/add/add_good.dart';
import 'package:athletic/home/screens/goods_mangament/show/show_goods.dart';
import 'package:athletic/models/good_model.dart';
import 'package:athletic/tools/customText.dart';
import 'package:flutter/material.dart';

class GoodsScreen extends StatelessWidget {
  const GoodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ApplicationController<GoodModel> controller =
        ApplicationController<GoodModel>();
    return FutureBuilder(
      future: GoodsBase.getAllProduct(),
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
          controller.equal(snapshot.data!.data);

          return Column(
            children: [
              AddGood(controller: controller),
              Expanded(
                  child: ShowGoods(
                controller: controller,
              ))
            ],
          );
        }
      },
    );
  }
}
