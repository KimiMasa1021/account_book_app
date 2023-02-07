import 'package:account_book_app/utility/hex_color.dart';
import 'package:flutter/material.dart';

final scheme1 = ColorScheme.fromSwatch(
  brightness: Brightness.light,
  primarySwatch: Colors.orange,
  backgroundColor: HexColor("#F9EFE6"),
  cardColor: HexColor("#FFFFFF"),
  accentColor: HexColor("#FCC750"),
  errorColor: Colors.blue,
).copyWith(
  onBackground: HexColor("#33272a"),
  onSurface: HexColor("#33272a"),
  onSecondary: HexColor("#594a4e"),
  tertiary: HexColor("#F9A46D"),
  onTertiary: HexColor("#FFF6FB"),
);

final scheme2 = ColorScheme.fromSwatch(
  brightness: Brightness.light,
  primarySwatch: Colors.yellow,
  backgroundColor: HexColor("#e3f6f5"),
  cardColor: HexColor("#fffffe"),
  accentColor: HexColor("#ffd803"),
  errorColor: Colors.blue,
).copyWith(
  onBackground: HexColor("#272343"),
  onSurface: HexColor("#272343"),
  onSecondary: HexColor("#2d334a"),
  tertiary: HexColor("#ffd803"),
  onTertiary: HexColor("#272343"),
);

final scheme3 = ColorScheme.fromSwatch(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  backgroundColor: HexColor("#fec7d7"),
  cardColor: HexColor("#fffffe"),
  accentColor: HexColor("#a786df"),
  errorColor: Colors.blue,
).copyWith(
  onBackground: HexColor("#0e172c"),
  onSurface: HexColor("#0e172c"),
  onSecondary: HexColor("#0e172c"),
  tertiary: HexColor("#0e172c"),
  onTertiary: HexColor("#fffffe"),
);

final scheme4 = ColorScheme.fromSwatch(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  backgroundColor: HexColor("#242629"),
  cardColor: HexColor("#16161a"),
  accentColor: HexColor("#2cb67d"),
  errorColor: Colors.blue,
).copyWith(
  onBackground: HexColor("#fffffe"),
  onSurface: HexColor("#fffffe"),
  onSecondary: HexColor("#94a1b2"),
  tertiary: HexColor("#7f5af0"),
  onTertiary: HexColor("#fffffe"),
);
final scheme5 = ColorScheme.fromSwatch(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  backgroundColor: HexColor("#271c19"),
  cardColor: HexColor("#55423d"),
  accentColor: HexColor("#9656a1"),
  errorColor: Colors.blue,
).copyWith(
  onBackground: HexColor("#fffffe"),
  onSurface: HexColor("#fffffe"),
  onSecondary: HexColor("#fff3ec"),
  tertiary: HexColor("#ffc0ad"),
  onTertiary: HexColor("#272343"),
);
final scheme6 = ColorScheme.fromSwatch(
  brightness: Brightness.dark,
  primarySwatch: Colors.blue,
  backgroundColor: HexColor("#6571A7"),
  cardColor: HexColor("#232946"),
  accentColor: HexColor("#fffffe"),
  errorColor: Colors.blue,
).copyWith(
  onBackground: HexColor("#121629"),
  onSurface: HexColor("#fffffe"),
  onSecondary: HexColor("#b8c1ec"),
  tertiary: HexColor("#eebbc3"),
  onTertiary: HexColor("#232946"),
);

ThemeData get makoGreenTheme {
  final primaryColor = HexColor("#68dbaf");
  final secondaryColor = HexColor("#b3ccbf");
  final tertiaryColor = HexColor("#99d680");
  return ThemeData.from(
    colorScheme: const ColorScheme.dark().copyWith(
      primary: primaryColor,
      secondary: secondaryColor,
      tertiary: tertiaryColor,
    ),
  ).copyWith(
    brightness: Brightness.dark,
    primaryColor: secondaryColor,
  );
}
