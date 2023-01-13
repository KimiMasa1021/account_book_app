import 'package:flutter/material.dart';
import 'dart:math' as math;

class DetailPercentPainter extends CustomPainter {
  DetailPercentPainter({required this.percent});
  final double percent;
  @override
  void paint(Canvas canvas, Size size) {
    double storeke = 20;
    final bottom = Offset(size.width / 2, size.height / 1.1);
    final backgroundPainter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Colors.black12
      ..strokeWidth = storeke;
    final progressPainter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = const Color.fromARGB(255, 253, 255, 115)
      ..strokeWidth = storeke;
    //背景描画
    canvas.drawArc(
      Rect.fromCenter(
        center: bottom,
        height: size.height,
        width: size.width,
      ),
      math.pi,
      math.pi,
      false,
      backgroundPainter,
    );
    //インジゲーター描画
    double end = percent;
    canvas.drawArc(
      Rect.fromCenter(
        center: bottom,
        height: size.height,
        width: size.width,
      ),
      math.pi,
      math.pi * end,
      false,
      progressPainter,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
