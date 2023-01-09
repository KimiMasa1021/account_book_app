import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../provider/general_provider.dart';
import '../../theme/app_theme.dart';

class GraphBar extends HookConsumerWidget {
  const GraphBar({
    super.key,
    required this.weekText,
    required this.percent,
    required this.color,
    required this.price,
  });
  final String weekText;
  final double percent;
  final Color color;
  final int price;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final savingCTL = ref.watch(savingControllerProvider.notifier);

    return Tooltip(
      message: savingCTL.formatYen(price),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              weekText,
              style: theme.textTheme.fs16.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.white,
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
                      color: Colors.white.withOpacity(0.9),
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
                          color: color,
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
