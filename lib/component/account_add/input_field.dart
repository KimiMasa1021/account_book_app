import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/general_provider.dart';

class InputField extends HookConsumerWidget {
  InputField({
    super.key,
    this.title,
    required this.function,
    required this.type,
    required this.controller,
    this.formatter,
  });
  final String? title;
  final Function() function;
  final TextInputType type;
  final TextEditingController controller;
  List<TextInputFormatter>? formatter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iESwicherState = ref.watch(incomeExpendSwicherProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 50,
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
                autofocus: true,
                controller: controller,
                textAlign: TextAlign.end,
                textInputAction: TextInputAction.next,
                keyboardType: type,
                inputFormatters: formatter ?? [],
                onTap: () => function(),
                style: const TextStyle(
                  fontSize: 23,
                ),
                decoration: InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: iESwicherState ? Colors.red : Colors.blue,
                      width: 2,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
