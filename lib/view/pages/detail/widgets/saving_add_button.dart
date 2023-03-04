import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../theme/app_text_theme.dart';

class SavingAddButton extends HookConsumerWidget {
  const SavingAddButton({
    super.key,
    required this.function,
  });
  final Function() function;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

    return InkWell(
      onTap: () {
        function();
      },
      child: Container(
        height: 60,
        width: double.infinity,
        margin: const EdgeInsets.only(
          bottom: 10,
          left: 15,
          right: 15,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Theme.of(context).colorScheme.secondary,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add_box_outlined,
              color: Theme.of(context).colorScheme.onSecondary,
              size: 35,
            ),
            const SizedBox(width: 10),
            Text(
              "節約記録追加",
              style: font.fs21.copyWith(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
