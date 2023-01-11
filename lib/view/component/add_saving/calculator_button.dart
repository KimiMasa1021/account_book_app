import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.function,
    required this.title,
  });
  final Function() function;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () async {
          await function();
        },
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: title,
          ),
        ),
      ),
    );
  }
}
