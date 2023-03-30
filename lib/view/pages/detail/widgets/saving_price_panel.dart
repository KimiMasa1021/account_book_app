import 'package:account_book_app/model/saving/saving_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../utility/format_yen.dart';
import '../../../theme/app_text_theme.dart';

class SavingPricePanel extends HookConsumerWidget {
  const SavingPricePanel({
    super.key,
    required this.state,
  });
  final SavingState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 30),
          Expanded(
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: Theme.of(context).cardColor,
                ),
                const SizedBox(width: 10),
                Text(
                  state.memo,
                  style: font.fs16.copyWith(),
                  overflow: TextOverflow.ellipsis,
                ),
                const Spacer(),
                Text(
                  FormatText.formatYen(state.price),
                  style: font.fs16.copyWith(),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
