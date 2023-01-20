import 'package:account_book_app/utility/hex_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyThemeData {
  const MyThemeData({
    required this.theme,
  });
  final ThemeData theme;

  // TODO material builderいまいち使いこなせないから
  // それぞれのモードの画面と設定を突き合わせて作っていくぅ～！

  //ライトテーマ
  factory MyThemeData.light() {
    return MyThemeData(
      theme: ThemeData.from(
        colorScheme: const ColorScheme.light().copyWith(
          background: HexColor("#ECECEC"),
        ),
      ),
    );
  }
  //ダークテーマ
  factory MyThemeData.dark() {
    return MyThemeData(
      theme: ThemeData.from(colorScheme: const ColorScheme.dark()),
    );
  }
  //アイアンマンテーマ
  factory MyThemeData.heroDarkTheme() {
    const primaryColor = Color(0xFF68D4C7);
    const secondaryColor = Color(0xFF40CCBB);
    return MyThemeData(
      theme: ThemeData.from(
        colorScheme: const ColorScheme.dark().copyWith(
          primary: primaryColor,
          secondary: secondaryColor,
        ),
      ).copyWith(
        brightness: Brightness.dark,
        primaryColor: secondaryColor,
        buttonTheme: const ButtonThemeData(
          buttonColor: secondaryColor,
        ),
        iconTheme: const IconThemeData(
          color: primaryColor,
        ),
        toggleableActiveColor: primaryColor,
        cupertinoOverrideTheme: const CupertinoThemeData(
          textTheme: CupertinoTextThemeData(),
        ),
      ),
    );
  }
}
