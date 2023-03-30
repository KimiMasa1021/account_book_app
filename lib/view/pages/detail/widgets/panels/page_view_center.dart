import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../model/target/target_state.dart';
import '../../../../../utility/format_text.dart';
import '../../../../../view_model/saving_controller.dart';
import '../../../../theme/app_text_theme.dart';
import '../detail_percent_painter.dart';

class PageViewCenter extends HookConsumerWidget {
  const PageViewCenter({
    super.key,
    required this.target,
  });
  final TargetState target;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saving = ref.watch(savingControllerProvider(target.docId));
    final font = ref.watch(myTextTheme);
    final percent = target.currentPrice / target.targetPrice;

    return saving.when(
      data: (data) {
        final priceList = data
            .where((e) => e.productId == target.docId)
            .map((e) => e.price)
            .toList();
        int sum;
        if (priceList.isEmpty) {
          sum = 0;
        } else {
          sum = priceList.reduce((a, b) => a + b);
        }
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            children: [
              Expanded(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CustomPaint(
                    painter: DetailPercentPainter(
                      percent: percent >= 1.0 ? 1.0 : percent,
                      barColor: Theme.of(context).colorScheme.secondary,
                      backColor: Theme.of(context).colorScheme.background,
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                "達成金額",
                                style: font.fs19.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              RichText(
                                text: TextSpan(
                                  style: Theme.of(context).textTheme.bodyMedium,
                                  children: [
                                    TextSpan(
                                      text: FormatText.formatYen(sum),
                                      style: font.fs33.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '円',
                                      style: font.fs21.copyWith(),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
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
                                  style: font.fs16,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                RichText(
                                  text: TextSpan(
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                    children: [
                                      TextSpan(
                                        text: FormatText.formatYen(
                                            target.targetPrice),
                                        style: font.fs27.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      TextSpan(
                                        text: '円',
                                        style: font.fs19.copyWith(),
                                      ),
                                    ],
                                  ),
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
      },
      loading: () {
        return const SizedBox();
      },
      error: (e, s) {
        return const SizedBox();
      },
    );
  }
}
