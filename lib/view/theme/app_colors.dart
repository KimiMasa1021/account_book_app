import 'package:flutter/material.dart';

class AppColors {
  const AppColors({
    required this.primary,
    required this.background,
    required this.err,
  });

  factory AppColors.light() {
    return const AppColors(
      primary: Color(0x00000111),
      background: Color(0xFFFFFFFF),
      err: Color(0xFFB00020),
    );
  }

  factory AppColors.dark() {
    return const AppColors(
      primary: Color(0x00000111),
      background: Color(0xFFFFFFFF),
      err: Color(0xFFB00020),
    );
  }

  final Color primary;
  final Color background;
  final Color err;
}
