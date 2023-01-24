import 'package:flutter/material.dart';
import 'my_color_scheme.dart';

class MyThemeData {
  const MyThemeData({
    required this.theme,
  });
  final ThemeData theme;

  //ライトテーマ
  factory MyThemeData.light() {
    return MyThemeData(
      theme: ThemeData.from(
        colorScheme: lightColorScheme,
        textTheme: textTheme,
        useMaterial3: true,
      ),
    );
  }
  //レモン
  factory MyThemeData.lemon() {
    return MyThemeData(
      theme: ThemeData.from(
        colorScheme: lemon,
        textTheme: textTheme,
        useMaterial3: true,
      ),
    );
  }
  //ダークテーマ
  factory MyThemeData.dark() {
    return MyThemeData(
      theme: ThemeData.from(
        colorScheme: darkColorScheme,
        textTheme: textTheme,
        useMaterial3: true,
      ),
    );
  }
  //テーマ３
  factory MyThemeData.heroDarkTheme() {
    return MyThemeData(
      theme: ThemeData.from(
        colorScheme: noNameColorScheme,
        textTheme: textTheme,
        useMaterial3: true,
      ),
    );
  }
  //チョコレート
  factory MyThemeData.chocolate() {
    return MyThemeData(
      theme: ThemeData.from(
        colorScheme: chocolate,
        textTheme: textTheme,
        useMaterial3: true,
      ),
    );
  }
}

final textTheme = const TextTheme().apply();

// https://m2.material.io/design/material-theming/implementing-your-theme.html#typography
// https://m2.material.io/design/material-theming/implementing-your-theme.html#color

