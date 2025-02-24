import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/home/screens/goods_mangament/add/add_good.dart';
import 'package:athletic/home/screens/goods_mangament/show/show_goods.dart';
import 'package:flutter/material.dart';

class GoodsScreen extends StatefulWidget {
  const GoodsScreen({super.key});

  @override
  State<GoodsScreen> createState() => _GoodsScreenState();
}

class _GoodsScreenState extends State<GoodsScreen> {
  final ApplicationController controller = ApplicationController();

  @override
  Widget build(BuildContext context) {
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
}
