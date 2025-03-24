import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final double width;
  final double? height;
  final Color? color;
  final double? pading;
  final double? margin;
  final double raduis;
  final double elevation;
  final Widget? child;
  final void Function()? onTap;
  const CustomContainer(
      {super.key,
      required this.width,
      this.height,
      this.color,
      this.pading,
      this.margin,
      this.raduis = 15,
      this.elevation = 1,
      this.onTap,
      this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(pading ?? 20),
        margin: EdgeInsets.all(margin ?? 10),
        width: MediaQuery.of(context).size.width * width,
        height: height == null
            ? null
            : (MediaQuery.of(context).size.height * height!),
        decoration: BoxDecoration(
            color: color ?? const Color(0xffF4DCAC),
            borderRadius: BorderRadius.circular(raduis),
            boxShadow: [
              BoxShadow(
                color: Theme.of(context).primaryColorDark.withOpacity(0.2),
                spreadRadius: elevation,
                blurRadius: elevation,
                offset: const Offset(0, 0), // changes position of shadow
              )
            ]),
        child: child,
      ),
    );
  }
}
