import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../component/saving/data_card.dart';
import '../../../provider/general_provider.dart';
import 'saving_add.dart';

class SavingData extends HookConsumerWidget {
  const SavingData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(usersControllerProvider);
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        SizedBox(
          height: size.height,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Column(
                  children: [
                    DataCard(
                      title: '目標',
                      subTitle: usersState!.target,
                    ),
                    AspectRatio(
                      aspectRatio: 1.35,
                      child: Container(
                        margin: const EdgeInsets.only(top: 13),
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 20),
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
                                bottom: BorderSide(),
                                left: BorderSide(),
                              ),
                            ),
                            gridData: FlGridData(show: false),
                            titlesData: FlTitlesData(
                              bottomTitles: AxisTitles(
                                sideTitles: SideTitles(showTitles: false),
                              ),
                              leftTitles: AxisTitles(
                                axisNameSize: 100,
                                sideTitles: SideTitles(
                                  showTitles: true,
                                  getTitlesWidget: (value, meta) =>
                                      const Text("*"),
                                ),
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
                                spots: [
                                  const FlSpot(1, 1),
                                  const FlSpot(2, 2),
                                  const FlSpot(3, 2),
                                  const FlSpot(4, 2),
                                  const FlSpot(5, 4),
                                  const FlSpot(6, 4.5),
                                  const FlSpot(7, 100),
                                ],
                                isCurved: false,
                              ),
                            ],
                          ),
                          swapAnimationDuration:
                              const Duration(milliseconds: 150),
                          swapAnimationCurve: Curves.linear,
                        ),
                      ),
                    ),
                    DataCard(
                      title: '目標金額',
                      subTitle: usersState.targetPrice.toString(),
                    ),
                    const DataCard(
                      title: '節約総金額',
                      subTitle: "380000",
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "達成率：45%",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        Text(
                          "節約履歴",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 10,
          bottom: 15,
          child: InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(SavingAdd.id);
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.lightBlueAccent,
              ),
              child: const Center(
                child: Icon(
                  Icons.savings_outlined,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
