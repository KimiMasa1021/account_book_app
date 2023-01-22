import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../view_model/theme_controller.dart';
import 'my_theme_data.dart';

enum ExThemeMode {
  system,
  light,
  dark,
  hero,
}

extension Extension on ExThemeMode {
  int get id {
    switch (this) {
      case ExThemeMode.system:
        return 0000;
      case ExThemeMode.light:
        return 0001;
      case ExThemeMode.dark:
        return 0002;
      case ExThemeMode.hero:
        return 0003;
      default:
        return 0;
    }
  }

  ThemeData get themeData {
    switch (this) {
      case ExThemeMode.system:
        return MyThemeData.light().theme;
      case ExThemeMode.light:
        return MyThemeData.light().theme;
      case ExThemeMode.dark:
        return MyThemeData.dark().theme;
      case ExThemeMode.hero:
        return MyThemeData.heroDarkTheme().theme;
      default:
        return MyThemeData.light().theme;
    }
  }

  String get themeName {
    switch (this) {
      case ExThemeMode.system:
        return "システム";
      case ExThemeMode.light:
        return "ライトテーマ";
      case ExThemeMode.dark:
        return "ダークテーマ";
      case ExThemeMode.hero:
        return "ヒーローテーマ";
      default:
        return "??????";
    }
  }
}
