import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../utility/format_yen.dart';
import '../../../theme/app_text_theme.dart';

class GraphBar extends HookConsumerWidget {
  const GraphBar({
    super.key,
    required this.weekText,
    required this.percent,
    required this.barColor,
    required this.price,
  });
  final String weekText;
  final double percent;
  final Color barColor;
  final int price;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

    return Tooltip(
      message: "${FormatText.formatYen(price)}円",
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              weekText,
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
                          color: barColor,
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
      ),
    );
  }
}
