import 'dart:math';

import 'package:flutter/material.dart';

class CustomCircularProgress extends StatelessWidget {
  final double percentage;
  final double radius;
  final double lineWidth;
  final Color backgroundColor;

  const CustomCircularProgress({
    super.key,
    required this.percentage,
    this.radius = 85.0,
    this.lineWidth = 10.0,
    this.backgroundColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: radius * 2,
      height: radius * 2,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: Size(radius * 2, radius * 2),
            painter: _CircularProgressPainter(
              percentage: percentage,
              lineWidth: lineWidth,
              progressColor: Colors.amber,
              backgroundColor: backgroundColor,
            ),
          ),
          Text(
            "${percentage.toStringAsFixed(2)}%",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class _CircularProgressPainter extends CustomPainter {
  final double percentage;
  final double lineWidth;
  final Color progressColor;
  final Color backgroundColor;

  _CircularProgressPainter({
    required this.percentage,
    required this.lineWidth,
    required this.progressColor,
    required this.backgroundColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - lineWidth) / 2;

    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, backgroundPaint);

    final progressPaint = Paint()
      ..color = progressColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = lineWidth
      ..strokeCap = StrokeCap.round;

    double sweepAngle = 2 * pi * (percentage / 100);

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
