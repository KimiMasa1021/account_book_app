import 'package:flutter/material.dart';

class RightShape extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions {
    return const EdgeInsets.only();
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection!);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    double radius = 20;
    double edge = 5;
    double gap = 5;

    return Path()
      ..moveTo(rect.left + gap, rect.top)
      ..lineTo(rect.right - radius, rect.top)
      ..arcToPoint(
        Offset(rect.right, rect.top + radius),
        radius: Radius.circular(radius),
      )
      ..lineTo(rect.right, rect.bottom - radius)
      ..arcToPoint(
        Offset(rect.right - radius, rect.bottom),
        radius: Radius.circular(radius),
      )
      ..lineTo(rect.left + gap, rect.bottom)
      ..lineTo(rect.left + gap, rect.bottom - edge)
      ..lineTo(rect.right - 20, rect.bottom - edge)
      ..arcToPoint(
        Offset(rect.right - 20, rect.bottom - edge - 20),
        radius: const Radius.circular(5),
        clockwise: false,
      )
      ..lineTo(rect.left + gap, rect.bottom - 25)
      ..lineTo(rect.left + gap, rect.bottom - 30)
      ..lineTo(rect.left, rect.bottom - 30)
      ..arcToPoint(
        Offset(rect.left, rect.top + edge),
        radius: const Radius.circular(36),
        clockwise: false,
      )
      ..lineTo(rect.left + gap, rect.top + edge)
      ..lineTo(rect.left + gap, rect.top)
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}

class LeftShape extends ShapeBorder {
  @override
  EdgeInsetsGeometry get dimensions {
    return const EdgeInsets.only();
  }

  @override
  Path getInnerPath(Rect rect, {TextDirection? textDirection}) {
    return getOuterPath(rect, textDirection: textDirection!);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    double radius = 20;
    double edge = 5;
    double gap = 5;

    return Path()
      ..moveTo(rect.left, rect.top)
      ..lineTo(rect.right - gap, rect.top)
      ..lineTo(rect.right - gap, rect.top + edge)
      ..lineTo(rect.right, rect.top + edge)
      ..arcToPoint(
        Offset(rect.right, rect.bottom - 30),
        radius: const Radius.circular(36),
        clockwise: false,
      )
      ..lineTo(rect.right - gap, rect.bottom - 30)
      ..lineTo(rect.right - gap, rect.bottom - 25)
      ..lineTo(rect.left + 20, rect.bottom - 25)
      ..arcToPoint(
        Offset(rect.left + 20, rect.bottom - 5),
        radius: const Radius.circular(5),
        clockwise: false,
      )
      ..lineTo(rect.right - gap, rect.bottom - 5)
      ..lineTo(rect.right - gap, rect.bottom)
      ..lineTo(rect.left + radius, rect.bottom)
      ..arcToPoint(
        Offset(rect.left, rect.bottom - radius),
        radius: Radius.circular(radius),
      )
      ..lineTo(rect.left, rect.top + radius)
      ..arcToPoint(
        Offset(rect.left + radius, rect.top),
        radius: Radius.circular(radius),
      )
      ..close();
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection? textDirection}) {}

  @override
  ShapeBorder scale(double t) {
    return this;
  }
}
