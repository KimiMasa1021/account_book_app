import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/general_provider.dart';

class InputDateField extends HookConsumerWidget {
  const InputDateField({
    super.key,
    required this.dateController,
    required this.function,
  });

  final TextEditingController dateController;
  final Function() function;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iESwicherState = ref.watch(incomeExpendSwicherProvider); //値の参照

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 50,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextFormField(
                autofocus: true,
                textInputAction: TextInputAction.next,
                controller: dateController,
                keyboardType: TextInputType.none,
                readOnly: true,
                onTap: () async => function(),
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
