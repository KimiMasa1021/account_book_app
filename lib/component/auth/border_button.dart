import 'package:flutter/material.dart';

import '../../constant/hex_color.dart';

class BorderButton extends StatelessWidget {
  const BorderButton({
    super.key,
    required this.function,
    required this.title,
  });
  final Function() function;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async => function(),
      child: Container(
        width: double.infinity,
        height: 58,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(123),
          ),
          border: Border.all(
            width: 3,
            color: HexColor("850E35"),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: HexColor("850E35"),
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
