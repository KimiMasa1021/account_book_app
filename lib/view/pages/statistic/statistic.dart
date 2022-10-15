import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../component/statistics/statistic_appbar.dart';
import 'daily_page.dart';
import 'monthly_page.dart';
import 'one_day_page.dart';

class Statistic extends HookConsumerWidget {
  const Statistic({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setDate = useState(DateTime.now());

    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SafeArea(
        child: Column(
          children: [
            const StatisticAppBar(),
            Expanded(
              child: TabBarView(
                children: [
                  MonthlyPage(setDate: setDate),
                  DailyPage(setDate: setDate),
                  OneDayPage(setDate: setDate),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// DefaultTabController.of(context)?.animateTo(1);

