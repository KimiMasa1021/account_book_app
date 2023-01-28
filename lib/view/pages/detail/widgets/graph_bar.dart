import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../view_model/saving_controller.dart';

class GraphBar extends HookConsumerWidget {
  const GraphBar({
    super.key,
    required this.weekText,
    required this.percent,
    required this.barColor,
    required this.price,
    required this.textColor,
  });
  final String weekText;
  final double percent;
  final Color barColor;
  final int price;
  final Color textColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savingCTL = ref.watch(savingControllerProvider.notifier);

    return Tooltip(
      message: savingCTL.formatYen(price),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Text(
              weekText,
              // style: theme.textTheme.fs16.copyWith(
              //   fontWeight: FontWeight.bold,
              //   color: textCol0r,
              // ),
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
                      color: Theme.of(context).backgroundColor,
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
