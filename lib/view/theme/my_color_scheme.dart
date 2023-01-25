import 'package:account_book_app/utility/hex_color.dart';
import 'package:flutter/material.dart';

final scheme1 = ColorScheme.fromSwatch(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  backgroundColor: HexColor("#fffffe"),
  cardColor: HexColor("#d9d4e7"),
  accentColor: HexColor("#fec7d7"),
  errorColor: Colors.blue,
).copyWith(
  onBackground: HexColor("#272343"),
  onSurface: HexColor("#0e172c"),
  onSecondary: HexColor("#0e172c"),
);

final scheme2 = ColorScheme.fromSwatch(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  backgroundColor: HexColor("#e3f6f5"),
  cardColor: HexColor("#fffffe"),
  accentColor: HexColor("#ffd803"),
  errorColor: Colors.blue,
).copyWith(
  onBackground: HexColor("#272343"),
  onSurface: HexColor("#272343"),
  onSecondary: HexColor("#2d334a"),
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
);
