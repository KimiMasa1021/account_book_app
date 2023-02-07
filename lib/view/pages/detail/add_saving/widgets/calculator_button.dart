import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    super.key,
    required this.onTap,
    required this.enterFucntion,
    required this.index,
  });
  final Function() onTap;
  final Function() enterFucntion;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: index == 4 ? Theme.of(context).colorScheme.tertiary : null,
      child: InkWell(
        onTap: () async {
          await onTap();
          await enterFucntion();
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: index == 4
              ? Icon(
                  Icons.keyboard_return,
                  color: Theme.of(context).colorScheme.onTertiary,
                )
              : index == 3
                  ? const Icon(
                      Icons.backspace_outlined,
                      size: 30,
                    )
                  : FittedBox(
                      child: Text(
                        index <= 2
                            ? (index + 1).toString()
                            : index == 11
                                ? "0"
                                : (index - 1).toString(),
                      ),
                    ),
        ),
      ),
    );
  }
}
