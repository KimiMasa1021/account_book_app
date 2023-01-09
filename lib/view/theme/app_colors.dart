import 'package:flutter/material.dart';

import '../../constant/hex_color.dart';

class AppColors {
  const AppColors({
    required this.primary,
    required this.background,
    required this.err,
  });

  final Color primary;
  final Color background;
  final Color err;

  factory AppColors.light() {
    return AppColors(
      primary: HexColor("#FFFFFF"),
      background: HexColor("F5F5F5"),
      err: const Color(0xFFB00020),
    );
  }

  factory AppColors.dark() {
    return AppColors(
      primary: HexColor("#151515"),
      background: HexColor("#202020"),
      err: const Color(0xFFB00020),
    );
  }
}
