import 'package:flutter/material.dart';

import '../../../../../constant/hex_color.dart';

class PageViewRight extends StatelessWidget {
  const PageViewRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 200,
      decoration: BoxDecoration(
        color: HexColor("#E0FED9"),
        borderRadius: BorderRadius.circular(0),
      ),
    );
  }
}
