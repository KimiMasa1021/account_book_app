import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../component/detail/detail_percent_painter.dart';
import '../../../../../constant/hex_color.dart';
import '../../../../../model/target_state.dart';
import '../../../../../provider/general_provider.dart';
import '../../../../theme/app_theme.dart';

class PageViewCenter extends HookConsumerWidget {
  const PageViewCenter({
    super.key,
    required this.target,
  });
  final TargetState target;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final saving = ref.watch(savingControllerProvider);
    final savingCTL = ref.watch(savingControllerProvider.notifier);
    final priceList = saving
        .where((e) => e.productId == target.docId)
        .map((e) => e.price)
        .toList();
    int sum;
    if (priceList.isEmpty) {
      sum = 0;
    } else {
      sum = priceList.reduce((a, b) => a + b);
    }
    final percent = sum / target.targetPrice;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: HexColor("#B3FFFC"),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: CustomPaint(
                painter: DetailPercentPainter(
                    percent: percent >= 1.0 ? 1.0 : percent),
                child: Stack(
                  children: [
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
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "目標金額",
                              style: theme.textTheme.fs16,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              savingCTL.formatYen(target.targetPrice),
                              style: theme.textTheme.fs21.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
