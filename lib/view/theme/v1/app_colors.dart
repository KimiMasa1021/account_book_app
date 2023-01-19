import 'package:flutter/material.dart';

import '../../../utility/hex_color.dart';

class AppColors {
  const AppColors({
    required this.primary,
    required this.secondary,
    required this.background,
    required this.err,
  });

  final Color primary;
  final Color secondary;
  final Color background;
  final Color err;

  factory AppColors.light() {
    return AppColors(
      primary: HexColor("#FFFFFF"),
      secondary: HexColor("#64b5f6"),
      background: HexColor("#F5F5F5"),
      err: const Color(0xFFB00020),
    );
  }

  factory AppColors.dark() {
    return AppColors(
      primary: HexColor("#151515"),
      secondary: HexColor("#64b5f6"),
      background: HexColor("#202020"),
      err: const Color(0xFFB00020),
    );
  }
}
