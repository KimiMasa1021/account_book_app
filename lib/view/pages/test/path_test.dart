import 'package:flutter/material.dart';
import 'dart:math' as math;

class PathTest extends StatelessWidget {
  const PathTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: CustomPaint(
            painter: MyPainter(percent: 80),
            child: Container(),
          ),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  MyPainter({required this.percent});
  final double percent;
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final backgroundPainter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Colors.black12
      ..strokeWidth = 30;
    final progressPainter = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..color = Colors.red
      ..strokeWidth = 30;
    //背景描画
    canvas.drawArc(
      Rect.fromCenter(
        center: center,
        height: size.height,
        width: size.width,
      ),
      math.pi,
      math.pi,
      false,
      backgroundPainter,
    );
    //インジゲーター描画
    double end = percent / 100;
    canvas.drawArc(
      Rect.fromCenter(
        center: center,
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
