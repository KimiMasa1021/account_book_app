import 'package:flutter/material.dart';

import '../../utility/hex_color.dart';

final lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Colors.white,
  onPrimary: Color(0xFF000000),
  primaryContainer: Color(0xFFDCEC79),
  onPrimaryContainer: Color(0xFF191E00),
  secondary: Color(0xFF9C4147),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFFFDADA),
  onSecondaryContainer: Color(0xFF40000B),
  tertiary: Color(0xFF4C6707),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFCDEF84),
  onTertiaryContainer: Color(0xFF141F00),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: HexColor("#ECECEC"),
  onBackground: Color(0xFF001F25),
  surface: Color(0xFFF8FDFF),
  onSurface: Color(0xFF001F25),
  surfaceVariant: Color(0xFFE4E3D2),
  onSurfaceVariant: Color(0xFF47483B),
  outline: Color(0xFF77786A),
  onInverseSurface: Color(0xFFD6F6FF),
  inverseSurface: Color(0xFF00363F),
  inversePrimary: Color(0xFFC0CF60),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF596400),
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFC0CF60),
  onPrimary: Color(0xFF2D3400),
  primaryContainer: Color(0xFF424B00),
  onPrimaryContainer: Color(0xFFDCEC79),
  secondary: Color(0xFFFFB3B4),
  onSecondary: Color(0xFF5F121C),
  secondaryContainer: Color(0xFF7E2931),
  onSecondaryContainer: Color(0xFFFFDADA),
  tertiary: Color(0xFFB2D26B),
  onTertiary: Color(0xFF253500),
  tertiaryContainer: Color(0xFF384E00),
  onTertiaryContainer: Color(0xFFCDEF84),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF001F25),
  onBackground: Color(0xFFA6EEFF),
  surface: Color(0xFF001F25),
  onSurface: Color(0xFFA6EEFF),
  surfaceVariant: Color(0xFF47483B),
  onSurfaceVariant: Color(0xFFC8C7B7),
  outline: Color(0xFF919283),
  onInverseSurface: Color(0xFF001F25),
  inverseSurface: Color(0xFFA6EEFF),
  inversePrimary: Color(0xFF596400),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFC0CF60),
);
