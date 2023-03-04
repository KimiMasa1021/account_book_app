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
      color: index == 4
          ? Theme.of(context).colorScheme.secondary
          : Theme.of(context).colorScheme.surface,
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
                  color: Theme.of(context).colorScheme.onSecondary,
                )
              : index == 3
                  ? Icon(
                      Icons.backspace_outlined,
                      size: 30,
                      color: Theme.of(context).colorScheme.onTertiary,
                    )
                  : FittedBox(
                      child: Text(
                        index <= 2
                            ? (index + 1).toString()
                            : index == 11
                                ? "0"
                                : (index - 1).toString(),
                        style: TextStyle(
                          color: index == 4
                              ? Theme.of(context).colorScheme.onSecondary
                              : Theme.of(context).colorScheme.onTertiary,
                        ),
                      ),
                    ),
        ),
      ),
    );
  }
}
