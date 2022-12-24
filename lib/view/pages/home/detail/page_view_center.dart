import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../component/home/custom_painter.dart';
import '../../../../constant/hex_color.dart';
import '../../../../model/target_state.dart';
import '../../../../provider/general_provider.dart';
import '../../../theme/app_theme.dart';

class PageViewCenter extends HookConsumerWidget {
  const PageViewCenter({
    super.key,
    required this.target,
    required this.percent,
    required this.sum,
  });
  final TargetState target;
  final double percent;
  final int sum;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final savingCTL = ref.watch(savingControllerProvider.notifier);

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          height: 200,
          decoration: BoxDecoration(
            color: HexColor("#B3FFFC"),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Align(
          alignment: const Alignment(0, 0),
          child: SizedBox(
            width: 200,
            height: 200,
            child: Transform.scale(
              scale: 1.15,
              child: CustomPaint(
                painter: MyPainter(percent: percent * 100),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "達成金額",
                style: theme.textTheme.fs19.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                savingCTL.formatYen(sum),
                style: theme.textTheme.fs33.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(width: 20),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "目標金額",
                    style: theme.textTheme.fs16.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    savingCTL.formatYen(target.targetPrice),
                    style: theme.textTheme.fs21.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
