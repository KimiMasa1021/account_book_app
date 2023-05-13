import 'package:account_book_app/application/providers/target_provider/state/target_state.dart';
import 'package:account_book_app/presentation/widgets/statistic/info_panel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../../application/providers/saving_provider/provider/saving_notifier_provider.dart';
import '../../../../common/format_text.dart';
import '../../../../common/theme/app_text_theme.dart';

class DetailHome extends ConsumerWidget {
  const DetailHome({
    super.key,
    required this.targetState,
  });
  final TargetState targetState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final saving = ref.watch(savingNotifierProvider(targetState.productId));
    final font = ref.watch(myTextTheme);

    return saving.when(
      data: (data) {
        final priceList = data.map((e) => e.price).toList();
        final sum =
            priceList.isNotEmpty ? priceList.reduce((v, e) => v + e) : 0;
        final remain = (targetState.targetPrice - sum) <= 0
            ? 0
            : targetState.targetPrice - sum;
        final percent = (sum / targetState.targetPrice) <= 1
            ? sum / targetState.targetPrice
            : 1.0;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                InfoPanel(
                  title: "現在の達成金額",
                  icon: Icons.savings_outlined,
                  text: FormatText.formatYen(sum),
                  unit: "円",
                  rightWidget: CircularPercentIndicator(
                    radius: 30.0,
                    lineWidth: 10.0,
                    percent: percent,
                    center: Text(
                      "${(percent * 100).round()}%",
                      style: font.fs21.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    progressColor: Theme.of(context).colorScheme.tertiary,
                  ),
                ),
                InfoPanel(
                  title: "残り",
                  icon: Icons.rocket_launch_outlined,
                  text: FormatText.formatYen(remain),
                  unit: "円",
                ),
                InfoPanel(
                  title: "達成目標",
                  icon: Icons.calendar_month_outlined,
                  text:
                      DateFormat("yyyy年MM月yy日").format(targetState.targetDate),
                  unit: "",
                ),
              ],
            ),
          ),
        );
      },
      error: (e, s) {
        return const SizedBox();
      },
      loading: () {
        return const SizedBox();
      },
    );
  }
}
