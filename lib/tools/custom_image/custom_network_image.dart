// ignore_for_file: file_names

import 'package:athletic/tools/custom_image/customImage.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final double h;
  final double w;
  final String url;
  const CustomNetworkImage(
      {super.key, required this.url, required this.w, required this.h});

  @override
  Widget build(BuildContext context) {
    return url.isNotEmpty
        ? Image.network(url,
            width: MediaQuery.of(context).size.width * w,
            height: MediaQuery.of(context).size.height * h,
            filterQuality: FilterQuality.high,
            fit: BoxFit.contain)
        : CustomImage(path: 'image/logo.png', w: w, h: h);
  }
}
