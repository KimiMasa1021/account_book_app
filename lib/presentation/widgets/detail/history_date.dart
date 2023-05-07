import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/providers/saving_provider/state/saving_state.dart';
import '../../../view/theme/app_text_theme.dart';

class HistoyDate extends ConsumerWidget {
  const HistoyDate({
    super.key,
    required this.today,
    required this.previous,
  });
  final SavingState today;
  final SavingState? previous;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

    final tod = today.createdAt;
    final pre = previous?.createdAt;

    if (pre == null) {
      return RichText(
        text: TextSpan(
          style: font.fs16.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
          children: [
            TextSpan(
              text: today.createdAt.month.toString(),
              style: font.fs21.copyWith(),
            ),
            const TextSpan(
              text: '月',
            ),
            TextSpan(
              text: today.createdAt.day.toString(),
              style: font.fs21.copyWith(),
            ),
            const TextSpan(
              text: '日',
            ),
          ],
        ),
      );
    } else if (tod.year != pre.year ||
        tod.month != pre.month ||
        tod.day != pre.day) {
      return RichText(
        text: TextSpan(
          style: font.fs16.copyWith(
            color: Theme.of(context).colorScheme.onBackground,
          ),
          children: [
            TextSpan(
              text: today.createdAt.month.toString(),
              style: font.fs21.copyWith(),
            ),
            const TextSpan(
              text: '月',
            ),
            TextSpan(
              text: today.createdAt.day.toString(),
              style: font.fs21.copyWith(),
            ),
            const TextSpan(
              text: '日',
            ),
          ],
        ),
      );
    } else {
      return const SizedBox();
    }
  }
}
