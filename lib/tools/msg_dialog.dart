import 'package:athletic/tools/custom_btn/customBtn.dart';
import 'package:flutter/material.dart';
import '../provider/language/get_text.dart';
import 'customText.dart';
import 'custom_image/customImage.dart';

msgDialog(
    {required BuildContext context1,
    required int state,
    required String text,
    void Function()? onClick}) async {
  await showDialog(
      context: context1,
      barrierDismissible: false,
      builder: (context) {
        return SimpleDialog(
          backgroundColor: Colors.transparent,
          elevation: 0,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              width: MediaQuery.of(context1).size.width * 0.25,
              decoration: BoxDecoration(
                  color: Theme.of(context1).primaryColorLight,
                  borderRadius: BorderRadius.circular(20)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImage(
                      path: state == 1
                          ? "image/true.png"
                          : state == -1
                              ? "image/false.png"
                              : "image/ques.png",
                      w: 0.22,
                      h: 0.15),
                  const SizedBox(height: 10),
                  TEXT(
                      text: text,
                      size: 18,
                      bold: true,
                      center: true,
                      color: Theme.of(context).primaryColorDark),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomBtn(
                            btnColor: Colors.green,
                            w: 0.115,
                            onClick: () {
                              Navigator.pop(context);
                            },
                            text: getText("cancel")),
                      ),
                      Visibility(
                          visible: onClick == null ? false : true,
                          child: const SizedBox(width: 10)),
                      Visibility(
                          visible: onClick == null ? false : true,
                          child: Expanded(
                            child: CustomBtn(
                                onClick: onClick,
                                w: 0.115,
                                text: getText("ok")),
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        );
      });
}
