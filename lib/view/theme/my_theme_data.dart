import 'package:flutter/material.dart';
import 'my_color_scheme.dart';

class MyThemeData {
  const MyThemeData({
    required this.theme,
  });
  final ThemeData theme;

  factory MyThemeData.themeData1() {
    return MyThemeData(
      theme: ThemeData.from(
        colorScheme: scheme1,
        textTheme: textTheme,
        useMaterial3: true,
      ),
    );
  }
  factory MyThemeData.themeData2() {
    return MyThemeData(
      theme: ThemeData.from(
        colorScheme: scheme2,
        textTheme: textTheme,
        useMaterial3: true,
      ),
    );
  }
  factory MyThemeData.themeData3() {
    return MyThemeData(
      theme: ThemeData.from(
        colorScheme: scheme3,
        textTheme: textTheme,
        useMaterial3: true,
      ),
    );
  }
  factory MyThemeData.themeData4() {
    return MyThemeData(
      theme: ThemeData.from(
        colorScheme: scheme4,
        textTheme: textTheme,
        useMaterial3: true,
      ),
    );
  }
  factory MyThemeData.themeData5() {
    return MyThemeData(
      theme: ThemeData.from(
        colorScheme: scheme5,
        textTheme: textTheme,
        useMaterial3: true,
      ),
    );
  }
  factory MyThemeData.themeData6() {
    return MyThemeData(
      theme: ThemeData.from(
        colorScheme: scheme6,
        textTheme: textTheme,
        useMaterial3: true,
      ),
    );
  }
}

final textTheme = const TextTheme().apply();

// https://m2.material.io/design/material-theming/implementing-your-theme.html#typography
// https://m2.material.io/design/material-theming/implementing-your-theme.html#color

