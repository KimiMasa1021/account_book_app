import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PriceChart extends StatelessWidget {
  const PriceChart({
    super.key,
    required this.savingChartList,
  });
  final List<int> savingChartList;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.35,
      child: Container(
        margin: const EdgeInsets.only(top: 13),
        padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(18)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(1, 1),
              color: Colors.grey,
              blurRadius: 3,
            ),
          ],
        ),
        child: LineChart(
          LineChartData(
            borderData: FlBorderData(
              border: const Border(
                bottom: BorderSide(width: 2),
                left: BorderSide(width: 2),
              ),
            ),
            gridData: FlGridData(show: false),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              leftTitles: AxisTitles(
                axisNameSize: 100,
              ),
              topTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
              rightTitles: AxisTitles(
                sideTitles: SideTitles(showTitles: false),
              ),
            ),
            lineBarsData: [
              LineChartBarData(
                spots: List.generate(
                  savingChartList.length,
                  (index) => FlSpot(
                      index.toDouble(), savingChartList[index].toDouble()),
                ),
                isCurved: false,
                color: Colors.black,
              ),
            ],
          ),
          swapAnimationDuration: const Duration(milliseconds: 150),
          swapAnimationCurve: Curves.linear,
        ),
      ),
    );
  }
}
