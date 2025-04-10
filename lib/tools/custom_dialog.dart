import 'package:athletic/tools/container/custom_container.dart';
import 'package:flutter/material.dart';
import '../provider/language/get_text.dart';
import 'custom_btn/customBtn.dart';
import 'waiting.dart';

customDialog(
    {required BuildContext context,
    required double width,
    double? height,
    required Widget child,
    void Function()? ok}) async {
  await showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return SimpleDialog(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        children: [
          CustomContainer(
              color: const Color(0xffF4DCAC),
              width: width,
              height: height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  child,
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                          child: CustomBtn(
                              textcolor: Colors.white,
                              btnColor: Colors.red,
                              onClick: () {
                                pOP(context);
                              },
                              text: getText("cancel"))),
                      Visibility(
                          visible: ok == null ? false : true,
                          child: const SizedBox(width: 10)),
                      Visibility(
                          visible: ok == null ? false : true,
                          child: Expanded(
                              child: CustomBtn(
                                  textcolor: Colors.white,
                                  btnColor: Colors.green,
                                  onClick: ok,
                                  text: getText("ok")))),
                    ],
                  )
                ],
              ))
        ],
      );
    },
  );
}
