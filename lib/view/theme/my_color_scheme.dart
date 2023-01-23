import 'package:flutter/material.dart';

import 'my_base_color.dart';
import 'my_theme_data.dart';

const colorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColor.baseColor,
  onPrimary: Colors.white,
  secondary: AppColor.baseColor,
  onSecondary: Colors.white,
  error: Color(0xffE80000),
  onError: Colors.white,
  background: AppColor.backgroundColor,
  onBackground: Color(0xff2D2D2D),
  surface: Colors.white,
  onSurface: Color(0xff2D2D2D),
);
