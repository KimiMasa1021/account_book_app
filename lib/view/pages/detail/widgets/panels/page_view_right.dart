import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../model/target/target_state.dart';
import '../../../../../view_model/saving_controller.dart';
import '../panel_right_tile.dart';

class PageViewRight extends ConsumerWidget {
  const PageViewRight({
    super.key,
    required this.target,
  });
  final TargetState target;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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

    final dateDifference = target.targetDate.difference(DateTime.now()).inDays;
    final remainAmount = target.targetPrice - sum;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PanelRightTile(
                  icon: Icons.calendar_today_outlined,
                  title: '達成予定日まで',
                  content: dateDifference.toString(),
                  unit: '日',
                ),
                PanelRightTile(
                  icon: Icons.attach_money_outlined,
                  title: '残りの金額',
                  content: savingCTL.formatYen((remainAmount)),
                  unit: '円',
                ),
                PanelRightTile(
                  icon: Icons.calendar_month,
                  title: '1日あたり',
                  content: savingCTL
                      .formatYen((remainAmount / dateDifference).ceil()),
                  unit: '円',
                ),
                PanelRightTile(
                  icon: Icons.person,
                  title: '1人あたり',
                  content: savingCTL
                      .formatYen((remainAmount / target.members.length).ceil()),
                  unit: '円',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
