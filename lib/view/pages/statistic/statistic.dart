import 'package:flutter/material.dart';

import '../../../component/statistics/statistic_appbar.dart';
import 'daily_page.dart';
import 'one_day_page.dart';

class Statistic extends StatelessWidget {
  const Statistic({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SafeArea(
        child: Column(
          children: const [
            StatisticAppBar(),
            Expanded(
              child: TabBarView(
                children: [
                  OneDayPage(),
                  DailyPage(),
                  Text("月別やで！！！！！！！！！！！！"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
