import 'package:flutter/material.dart';

import '../../../component/statistics/statistic_appbar.dart';

class Statistic extends StatelessWidget {
  const Statistic({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: 0,
      child: SafeArea(
        child: Column(
          children: [
            // My App Bar
            StatisticAppBar(),
            // Content
            Expanded(
              child: TabBarView(
                children: [
                  Text("一日"),
                  Text("日別ｑ"),
                  Text("一日"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
