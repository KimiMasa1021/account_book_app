import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'font_size.dart';

final myTextTheme = Provider((ref) => AppTextTheme());

class AppTextTheme {
  const AppTextTheme._({
    required this.fs16,
    required this.fs19,
    required this.fs21,
    required this.fs27,
    required this.fs33,
  });
  factory AppTextTheme() {
    final normalRegular = GoogleFonts.notoSans(
      textStyle: const TextStyle(
        fontWeight: FontWeight.w400,
        height: 1.5,
        leadingDistribution: TextLeadingDistribution.even,
      ),
    );
    return AppTextTheme._(
      fs16: const TextStyle(fontSize: FontSize.pt16).merge(normalRegular),
      fs19: const TextStyle(fontSize: FontSize.pt19).merge(normalRegular),
      fs21: const TextStyle(fontSize: FontSize.pt21).merge(normalRegular),
      fs27: const TextStyle(fontSize: FontSize.pt27).merge(normalRegular),
      fs33: const TextStyle(fontSize: FontSize.pt33).merge(normalRegular),
    );
  }
  final TextStyle fs16;
  final TextStyle fs19;
  final TextStyle fs21;
  final TextStyle fs27;
  final TextStyle fs33;
}
