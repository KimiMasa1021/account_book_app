import 'package:flutter/material.dart';
import 'my_theme_data.dart';

enum ExThemeMode {
  theme1,
  theme2,
  theme3,
  theme4,
  theme5,
  theme6,
}

extension Extension on ExThemeMode {
  int get id {
    switch (this) {
      case ExThemeMode.theme1:
        return 0001;
      case ExThemeMode.theme2:
        return 0002;
      case ExThemeMode.theme3:
        return 0003;
      case ExThemeMode.theme4:
        return 0004;
      case ExThemeMode.theme5:
        return 0005;
      case ExThemeMode.theme6:
        return 0006;
      default:
        return 0;
    }
  }

  ThemeData get themeData {
    switch (this) {
      case ExThemeMode.theme1:
        return MyThemeData.themeData1().theme;
      case ExThemeMode.theme2:
        return MyThemeData.themeData2().theme;
      case ExThemeMode.theme3:
        return MyThemeData.themeData3().theme;
      case ExThemeMode.theme4:
        return MyThemeData.themeData4().theme;
      case ExThemeMode.theme5:
        return MyThemeData.themeData5().theme;
      case ExThemeMode.theme6:
        return MyThemeData.themeData6().theme;
      default:
        return MyThemeData.themeData1().theme;
    }
  }

  String get themeName {
    switch (this) {
      case ExThemeMode.theme1:
        return "テーマ１";
      case ExThemeMode.theme2:
        return "テーマ２";
      case ExThemeMode.theme3:
        return "テーマ３";
      case ExThemeMode.theme4:
        return "テーマ４";
      case ExThemeMode.theme5:
        return "テーマ５";
      case ExThemeMode.theme6:
        return "テーマ６";
      default:
        return "テーマ？？";
    }
  }
}
