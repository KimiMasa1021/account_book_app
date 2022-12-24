import 'package:flutter/material.dart';

import '../../../../constant/hex_color.dart';

class PageViewLeft extends StatelessWidget {
  const PageViewLeft({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 200,
      decoration: BoxDecoration(
        color: HexColor("#FFB0B0"),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
