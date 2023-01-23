import 'package:flutter/material.dart';
import 'my_base_color.dart';

final lightTextTheme = const TextTheme().apply(
  displayColor: LightColor.baseTextColor,
  bodyColor: LightColor.baseTextColor,
);

final darkTextTheme = const TextTheme().apply(
  displayColor: DarkColor.baseTextColor,
  bodyColor: DarkColor.baseTextColor,
);
