import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../constant/hex_color.dart';
import '../../../../model/target_state.dart';
import '../../../../provider/general_provider.dart';
import '../../../theme/app_theme.dart';

class PageViewLeft extends HookConsumerWidget {
  const PageViewLeft({
    super.key,
    required this.target,
  });
  final TargetState target;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final saving = ref.watch(savingControllerProvider);
    final now = DateTime.now();
    final additionalDay = now.subtract(const Duration(days: 7));
    final savingList = saving
        .where((e) =>
            e.productId == target.docId && e.createdAt.isAfter(additionalDay))
        .toList();

    final weeklyList = List.generate(7, (index) {
      final test = savingList
          .where((e) =>
              DateTime(e.createdAt.year, e.createdAt.month, e.createdAt.day) ==
              DateTime(additionalDay.year, additionalDay.month,
                  additionalDay.day + index))
          .map((e) => e.price)
          .toList();
      if (test.isEmpty) return 0.0;

      return test.reduce(max).toDouble();
    });

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: HexColor("#FFB0B0"),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 30,
            margin: const EdgeInsets.only(left: 20, top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(
                    Icons.arrow_circle_left,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "2022年12月 7~13日",
                  style: theme.textTheme.fs16.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Icon(
                    Icons.arrow_circle_right,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: BarChart(
              BarChartData(
                barTouchData: BarTouchData(
                  enabled: false,
                ),
                titlesData: FlTitlesData(
                  show: true,
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: getTitles,
                      reservedSize: 38,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 27,
                      interval: 1,
                      getTitlesWidget: leftTitles,
                    ),
                  ),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                  rightTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: false,
                ),
                barGroups: List.generate(
                  // weeklyList.length,
                  7,
                  (i) {
                    switch (i) {
                      case 0:
                        return makeGroupData(
                          0,
                          weeklyList[i],
                          barColor: Colors.greenAccent,
                        );
                      case 1:
                        return makeGroupData(
                          1,
                          weeklyList[i],
                          barColor: Colors.greenAccent,
                        );
                      case 2:
                        return makeGroupData(
                          2,
                          weeklyList[i],
                          barColor: Colors.greenAccent,
                        );
                      case 3:
                        return makeGroupData(
                          3,
                          weeklyList[i],
                          barColor: Colors.greenAccent,
                        );
                      case 4:
                        return makeGroupData(
                          4,
                          weeklyList[i],
                          barColor: Colors.greenAccent,
                        );
                      case 5:
                        return makeGroupData(
                          5,
                          weeklyList[i],
                          barColor: Colors.greenAccent,
                        );
                      case 6:
                        debugPrint(weeklyList[i].toString());
                        return makeGroupData(
                          6,
                          weeklyList[i],
                          isTouched: true,
                          barColor: Colors.greenAccent,
                        );
                      default:
                        return throw Error();
                    }
                  },
                ),
                gridData: FlGridData(show: false),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget leftTitles(double value, TitleMeta meta) {
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 0,
      child: Container(),
    );
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color barColor = Colors.white,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: isTouched ? Colors.redAccent : barColor,
          width: width,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            // toY: max,
            color: Colors.white,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('mon', style: style);
        break;
      case 1:
        text = const Text('tue', style: style);
        break;
      case 2:
        text = const Text('wed', style: style);
        break;
      case 3:
        text = const Text('thu', style: style);
        break;
      case 4:
        text = const Text('fir', style: style);
        break;
      case 5:
        text = const Text('sat', style: style);
        break;
      case 6:
        text = const Text('sun', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
}
