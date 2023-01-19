import 'package:flutter/material.dart';

class MyThemeData {
  const MyThemeData({
    required this.theme,
  });
  final ThemeData theme;

  //ライトテーマ
  factory MyThemeData.light() {
    return MyThemeData(theme: ThemeData.light());
  }
  //ダークテーマ
  factory MyThemeData.dark() {
    return MyThemeData(theme: ThemeData.dark());
  }
  //アイアンマンテーマ
  factory MyThemeData.heroDarkTheme() {
    return MyThemeData(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.red,
        backgroundColor: Colors.black,
      ),
    );
  }
}
