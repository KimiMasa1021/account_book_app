import 'package:account_book_app/application/providers/target_provider/provider/target_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../../application/providers/go_router_provider/routes/routes.dart';
import '../../../../application/providers/target_provider/state/target_state.dart';
import '../../../../common/format_text.dart';
import '../../../../common/theme/app_text_theme.dart';

class DetailOverview extends ConsumerWidget {
  const DetailOverview({
    super.key,
    required this.state,
  });
  final TargetState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final targetCTL = ref.watch(targetNotifierProvider.notifier);

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "目標",
              style: font.fs21.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              state.target,
              style: font.fs19.copyWith(),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                const Icon(Icons.calendar_month_outlined),
                const SizedBox(width: 10),
                Text(
                  DateFormat("yyyy年MM月yy日").format(state.targetDate),
                  style: font.fs21.copyWith(),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.attach_money_outlined),
                const SizedBox(width: 10),
                Text(
                  "${FormatText.formatYen(state.targetPrice)}円",
                  style: font.fs21.copyWith(),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.people),
                const SizedBox(width: 10),
                Text(
                  "${state.members.length}人",
                  style: font.fs21.copyWith(),
                ),
              ],
            ),
            InkWell(
              onTap: () async => await targetCTL.showExitProjectDialog(
                context,
                state,
                () {
                  context.pop();
                  context.go(Routes.list);
                },
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  "プロジェクトを抜ける",
                  style: font.fs19.copyWith(color: Colors.red),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
