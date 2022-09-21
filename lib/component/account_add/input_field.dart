import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputField extends StatelessWidget {
  const InputField(
      {super.key, this.title, required this.function, required this.type});
  final String? title;
  final Function() function;
  final TextInputType type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 60,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            title != null
                ? Text(
                    title!,
                    style: const TextStyle(
                      fontSize: 25,
                    ),
                  )
                : const SizedBox(),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                textAlign: TextAlign.end,
                keyboardType: type,
                onTap: () => function(),
                style: const TextStyle(
                  fontSize: 25,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
