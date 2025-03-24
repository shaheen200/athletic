import 'package:athletic/controller/application_controller.dart';
import 'package:athletic/database/time_work_base.dart';
import 'package:athletic/home/screens/time_work/add/add_time_work.dart';
import 'package:athletic/home/screens/time_work/show/show_time_work.dart';
import 'package:athletic/models/time_work_model.dart';
import 'package:athletic/tools/customText.dart';
import 'package:flutter/material.dart';

class TimeWorkScreen extends StatelessWidget {
  const TimeWorkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ApplicationController<TimeWorkModel> controller =
        ApplicationController<TimeWorkModel>();
    return FutureBuilder(
      future: TimeWorkBase.get(),
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
          return Column(
            children: [
              AddTimeWork(controller: controller),
              Expanded(
                  child: ShowTimeWork(
                controller: controller,
              ))
            ],
          );
        }
      },
    );
  }
}
