import 'package:athletic/database/local_base.dart';
import 'package:athletic/models/user_model.dart';
import 'package:athletic/tools/container/custom_container.dart';
import 'package:athletic/tools/customText.dart';
import 'package:athletic/tools/custom_appbar.dart';
import 'package:athletic/tools/custom_image/customImage.dart';
import 'package:athletic/tools/custom_inductor/custom_Inductor.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel? userData;

  @override
  void initState() {
    LocalBase.getUserData().then(
      (value) {
        setState(() {
          userData = value;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppbar(),
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        CustomContainer(
          pading: 20,
          color: const Color(0xffEFCF8B),
          width: 0.6,
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const TEXT(
                            text: 'مرحبا مجددا', size: 20, color: Colors.black),
                        const SizedBox(width: 5),
                        TEXT(
                            text: userData == null ? '' : userData!.userName,
                            size: 20,
                            color: Theme.of(context).primaryColor,
                            bold: true),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const TEXT(
                        text:
                            'مرحبًا بك فيEagle Gym المكان المثالي لتحقيق أهدافك الرياضية',
                        size: 17,
                        color: Colors.black)
                  ],
                ),
              ),
              const CustomImage(path: 'image/avatar.png', w: 0.1, h: 0.1),
            ],
          ),
        ),
        const Spacer(),
        Row(
          children: [
            Expanded(
              child: CustomContainer(
                color: const Color(0xffEFCF8B),
                pading: 30,
                margin: 25,
                height: 0.3,
                width: 1,
                child: Column(
                  children: [
                    const TEXT(
                        text: 'الاشتركات المنتهيه', size: 17, bold: true),
                    const Spacer(),
                    CustomInductor(
                        inductor: 50,
                        width: MediaQuery.of(context).size.width * 0.15,
                        height: MediaQuery.of(context).size.height * 0.2,
                        borderWidth: 20,
                        child: const TEXT(text: '50', size: 20, bold: true)),
                    const Spacer(),
                  ],
                ),
              ),
            ),

            //=================================================================

            const Expanded(
              child: CustomContainer(
                color: Color(0xffEFCF8B),
                pading: 30,
                margin: 25,
                height: 0.3,
                width: 1,
                child: Column(
                  children: [
                    TEXT(text: 'الاشتركات النشطة', size: 17, bold: true),
                    Spacer(),
                    TEXT(text: '500', size: 20, bold: true),
                    Spacer(),
                  ],
                ),
              ),
            ),

            //=========================================================================
            const Expanded(
              child: CustomContainer(
                color: Color(0xffEFCF8B),
                pading: 30,
                margin: 25,
                height: 0.3,
                width: 1,
                child: Column(
                  children: [
                    TEXT(text: 'الاشتركات المنتهيه', size: 17, bold: true),
                    Spacer(),
                    TEXT(text: '500', size: 20, bold: true),
                    Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
        const Spacer(),
      ],
    );
  }
}

/**
 * Stack(
      children: [
        const SizedBox(width: double.infinity, height: double.infinity),
        const Center(
            child: CustomImage(path: 'image/logo.png', w: 0.6, h: 0.6)),
        Positioned(
            top: 20,
            left: 20,
            child: CustomBtn(
                textcolor: Colors.white,
                onClick: () {
                  goToPage(context, const LoginPage());
                },
                text: getText('logout')))
      ],
    );
 */
