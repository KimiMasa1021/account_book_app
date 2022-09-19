import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../constant/hex_color.dart';

class PaintedButton extends StatelessWidget {
  const PaintedButton({
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
          color: HexColor("850E35"),
          borderRadius: const BorderRadius.all(
            Radius.circular(123),
          ),
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}
