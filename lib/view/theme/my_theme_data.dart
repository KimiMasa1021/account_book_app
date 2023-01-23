import 'package:flutter/material.dart';
import 'my_color_scheme.dart';
import 'my_text_theme.dart';

class MyThemeData {
  const MyThemeData({
    required this.theme,
  });
  final ThemeData theme;

  //ライトテーマ
  factory MyThemeData.light() {
    return MyThemeData(
      theme: ThemeData.from(
        colorScheme: colorScheme,
        textTheme: textTheme,
      ),
    );
  }
  //ダークテーマ
  factory MyThemeData.dark() {
    return MyThemeData(
      theme: ThemeData.from(
        colorScheme: colorScheme,
        textTheme: textTheme,
      ),
    );
  }
  //

  factory MyThemeData.heroDarkTheme() {
    return MyThemeData(
      theme: ThemeData.from(
        colorScheme: colorScheme,
        textTheme: textTheme,
      ),
    );
  }
}


// https://m2.material.io/design/material-theming/implementing-your-theme.html#typography
// https://m2.material.io/design/material-theming/implementing-your-theme.html#color


  /*  return MyThemeData(
      theme: ThemeData.from(
        colorScheme: const ColorScheme.dark().copyWith(
          background: HexColor("#15191C"),
        ),
        useMaterial3: true,
      ).copyWith(
        colorScheme: ColorScheme.dark(
          primary: const Color.fromARGB(255, 74, 29, 156),
          onPrimaryContainer: Colors.yellow,
          surface: HexColor("#2B2F54"),
          tertiary: HexColor("#2B2F54"),
          tertiaryContainer: const Color.fromARGB(255, 99, 39, 212),
        ),
        cardColor: HexColor("#2B2F54"),
      ),
    );

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
    */