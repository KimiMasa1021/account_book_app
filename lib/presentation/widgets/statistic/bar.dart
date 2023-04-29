import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../common/format_text.dart';
import '../../../view/theme/app_text_theme.dart';

class Bar extends HookConsumerWidget {
  const Bar({
    super.key,
    required this.index,
    required this.percent,
  });
  final int index;
  final double percent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5, bottom: 7),
          child: Text(
            FormatText.formatWeek(index + 1),
            style: font.fs16.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
            height: double.infinity,
            width: 20,
            child: Stack(
              children: [
                Container(
                  width: 20,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: BorderRadius.circular(100),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: FractionallySizedBox(
                    widthFactor: 1,
                    heightFactor: percent,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.tertiary,
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
