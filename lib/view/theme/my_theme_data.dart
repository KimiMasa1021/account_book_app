import 'package:account_book_app/utility/hex_color.dart';
import 'package:flutter/material.dart';

class MyThemeData {
  const MyThemeData({
    required this.theme,
  });
  final ThemeData theme;

  //ライトテーマ
  factory MyThemeData.light() {
    return MyThemeData(
      theme: ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.light(
          background: HexColor("#ECECEC"),
        ),
        textTheme: Typography.material2021().black,
      ).copyWith(
        colorScheme: const ColorScheme.light().copyWith(
          primary: const Color.fromARGB(255, 255, 205, 201),
          tertiary: Colors.white,
          onPrimaryContainer: Colors.yellow,
          secondaryContainer: Colors.red,
          tertiaryContainer: HexColor("#0C83FB"),
        ),
        iconTheme: IconThemeData(
          color: HexColor("#090B0C"),
        ),
      ),
    );
  }
  //ダークテーマ
  factory MyThemeData.dark() {
    return MyThemeData(
      theme: ThemeData.from(
        colorScheme: const ColorScheme.dark().copyWith(
          background: HexColor("#15191C"),
        ),
        useMaterial3: true,
      ).copyWith(
        colorScheme: ColorScheme.dark(
          primary: Color.fromARGB(255, 74, 29, 156),
          onPrimaryContainer: Colors.yellow,
          surface: HexColor("#2B2F54"),
          tertiary: HexColor("#2B2F54"),
          tertiaryContainer: Color.fromARGB(255, 99, 39, 212),
        ),
        cardColor: HexColor("#2B2F54"),
      ),
    );
  }
  //アイアンマンテーマ

  factory MyThemeData.heroDarkTheme() {
    return MyThemeData(
      theme: ThemeData.from(
        colorScheme: const ColorScheme.dark(
            // background: Colors.red,
            ),
        textTheme: Typography.material2021().black,
      ).copyWith(
        colorScheme: const ColorScheme.dark().copyWith(
          primary: const Color.fromARGB(255, 221, 249, 255),
          onPrimaryContainer: Colors.yellow,
          secondaryContainer: HexColor("#2B2F54"),
          surface: HexColor("#E43928"),
          tertiary: const Color.fromARGB(255, 255, 203, 59),
        ),
        cardColor: HexColor("#E43928"),
        iconTheme: IconThemeData(
          color: HexColor("#090B0C"),
        ),
      ),
    );
  }
}
