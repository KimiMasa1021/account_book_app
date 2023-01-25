import 'package:account_book_app/utility/hex_color.dart';
import 'package:flutter/material.dart';

final teaColorScheme = ColorScheme(
  brightness: Brightness.light,
  background: HexColor("#abd1c6"), //background
  onBackground: HexColor("#001e1d"), //headline
  primary: HexColor("#001e1d"), // headline
  onPrimary: HexColor("#fffffe"), // card headline
  secondary: HexColor("#f9bc60"), // highlight
  onSecondary: HexColor("#abd1c6"), // card paragraph
  surface: HexColor("#004643"), // card back
  onSurface: HexColor("#fffffe"), //headline
  tertiary: HexColor("#e16162"), // tertiary
  onError: const Color(0xFFBA1A1A),
  error: const Color.fromARGB(255, 255, 250, 250),
);

final lemon = ColorScheme.fromSwatch(
  brightness: Brightness.light,
  primarySwatch: Colors.blue,
  backgroundColor: HexColor("#e3f6f5"),
  cardColor: HexColor("#fffffe"),
  accentColor: HexColor("#ffd803"),
  errorColor: Colors.blue,
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFF1C048),
  onPrimary: Color(0xFF3F2E00),
  primaryContainer: Color(0xFF5B4300),
  onPrimaryContainer: Color(0xFFFFDF9B),
  secondary: Color(0xFFD7C4A0),
  onSecondary: Color(0xFF3A2F15),
  secondaryContainer: Color(0xFF52452A),
  onSecondaryContainer: Color(0xFFF4E0BB),
  tertiary: Color(0xFF8ED88B),
  onTertiary: Color(0xFF00390C),
  tertiaryContainer: Color(0xFF025316),
  onTertiaryContainer: Color(0xFFA9F5A5),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1E1B16),
  onBackground: Color(0xFFE9E1D9),
  surface: Color(0xFF1E1B16),
  onSurface: Color(0xFFE9E1D9),
  surfaceVariant: Color(0xFF4D4639),
  onSurfaceVariant: Color(0xFFD0C5B4),
  outline: Color(0xFF999080),
  onInverseSurface: Color(0xFF1E1B16),
  inverseSurface: Color(0xFFE9E1D9),
  inversePrimary: Color(0xFF785A00),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFF1C048),
);

const noNameColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF36D8F9),
  onPrimary: Color(0xFF003640),
  primaryContainer: Color(0xFF004E5C),
  onPrimaryContainer: Color(0xFFABEDFF),
  secondary: Color(0xFFC0C1FF),
  onSecondary: Color(0xFF0C00AA),
  secondaryContainer: Color(0xFF211DDA),
  onSecondaryContainer: Color(0xFFE1E0FF),
  tertiary: Color(0xFFFFB2BB),
  onTertiary: Color(0xFF5F1125),
  tertiaryContainer: Color(0xFF7D293A),
  onTertiaryContainer: Color(0xFFFFD9DD),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF191C1D),
  onBackground: Color(0xFFE1E3E4),
  surface: Color(0xFF191C1D),
  onSurface: Color(0xFFE1E3E4),
  surfaceVariant: Color(0xFF3F484B),
  onSurfaceVariant: Color(0xFFBFC8CB),
  outline: Color(0xFF899295),
  onInverseSurface: Color(0xFF191C1D),
  inverseSurface: Color(0xFFE1E3E4),
  inversePrimary: Color(0xFF00687A),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF36D8F9),
);

const chocolate = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFFFFB1C8),
  onPrimary: Color(0xFF5E1133),
  primaryContainer: Color(0xFF7B2949),
  onPrimaryContainer: Color(0xFFFFD9E2),
  secondary: Color(0xFFE3BDC6),
  onSecondary: Color(0xFF422931),
  secondaryContainer: Color(0xFF5A3F47),
  onSecondaryContainer: Color(0xFFFFD9E2),
  tertiary: Color(0xFFEFBD94),
  onTertiary: Color(0xFF48290B),
  tertiaryContainer: Color(0xFF623F20),
  onTertiaryContainer: Color(0xFFFFDCC1),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF201A1B),
  onBackground: Color(0xFFEBE0E1),
  surface: Color(0xFF201A1B),
  onSurface: Color(0xFFEBE0E1),
  surfaceVariant: Color(0xFF514347),
  onSurfaceVariant: Color(0xFFD5C2C6),
  outline: Color(0xFF9E8C90),
  onInverseSurface: Color(0xFF201A1B),
  inverseSurface: Color(0xFFEBE0E1),
  inversePrimary: Color(0xFF984061),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFFFFB1C8),
);
