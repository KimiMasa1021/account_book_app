import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../application/providers/create_target_provider/provider/create_target_provider.dart';

class CreateTargetDate extends ConsumerWidget {
  const CreateTargetDate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createTarget = ref.watch(createTargetNotifierProvider);
    final createTargetCTL = ref.watch(createTargetNotifierProvider.notifier);

    return Column(
      children: [
        InkWell(
          onTap: () async => await createTargetCTL.datePicker(context),
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_month,
                ),
                const SizedBox(width: 10),
                Text(
                  createTarget.targetDate.value != null
                      ? DateFormat('yyyy年MM月dd日')
                          .format(createTarget.targetDate.value!)
                      : "日付を選択してください",
                  style: const TextStyle(
                    fontSize: 19,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
