import 'package:flutter/material.dart';
import 'my_theme_data.dart';

enum ExThemeMode {
  light,
  lemon,
  dark,
  hero,
  chocolate,
}

extension Extension on ExThemeMode {
  int get id {
    switch (this) {
      case ExThemeMode.light:
        return 0001;
      case ExThemeMode.lemon:
        return 0002;
      case ExThemeMode.dark:
        return 0003;
      case ExThemeMode.hero:
        return 0004;
      case ExThemeMode.chocolate:
        return 0005;
      default:
        return 0;
    }
  }

  ThemeData get themeData {
    switch (this) {
      case ExThemeMode.light:
        return MyThemeData.light().theme;
      case ExThemeMode.lemon:
        return MyThemeData.lemon().theme;
      case ExThemeMode.dark:
        return MyThemeData.dark().theme;
      case ExThemeMode.hero:
        return MyThemeData.heroDarkTheme().theme;
      case ExThemeMode.chocolate:
        return MyThemeData.chocolate().theme;

      default:
        return MyThemeData.light().theme;
    }
  }

  String get themeName {
    switch (this) {
      case ExThemeMode.light:
        return "ライトテーマ";
      case ExThemeMode.lemon:
        return "レモン";
      case ExThemeMode.dark:
        return "ダークテーマ";
      case ExThemeMode.hero:
        return "うんち";
      case ExThemeMode.chocolate:
        return "チョコレート";
      default:
        return "？？？？";
    }
  }
}
