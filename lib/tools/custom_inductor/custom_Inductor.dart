import 'package:flutter/material.dart';

class CustomInductor extends StatelessWidget {
  final double width;
  final double height;
  final double borderWidth;
  final double inductor; // Percentage of the active border
  final Widget? child;

  const CustomInductor({
    super.key,
    required this.width,
    required this.height,
    required this.borderWidth,
    required this.inductor, // Passed as percentage (e.g., 25 for 1/4 active)
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(width, height),
            painter:
                CirclePainter(borderWidth: borderWidth, inductor: inductor),
          ),
          if (child != null) child!,
        ],
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double borderWidth;
  final double inductor; // Percentage of the border that is active

  CirclePainter({required this.borderWidth, required this.inductor});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width < size.height ? size.width : size.height) / 2 -
        borderWidth / 2;

    // Paint for the active part of the border
    final activePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = const Color(0xffE6B348)
      ..strokeWidth = borderWidth;

    // Paint for the inactive part of the border
    final inactivePaint = Paint()
      ..style = PaintingStyle.stroke
      ..color = Colors.transparent
      ..strokeWidth = borderWidth;

    // Draw the arc based on the inductor percentage
    final sweepAngle =
        2 * 3.141592653589793 * (inductor / 100); // Active portion angle
    final remainingAngle =
        2 * 3.141592653589793 - sweepAngle; // Inactive portion angle

    // Draw active arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.141592653589793 / 2, // Start angle (top of the circle)
      sweepAngle, // Sweep angle (active portion)
      false,
      activePaint,
    );

    // Draw inactive arc
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -3.141592653589793 / 2 + sweepAngle, // Start angle (inactive portion)
      remainingAngle, // Sweep angle (inactive portion)
      false,
      inactivePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
