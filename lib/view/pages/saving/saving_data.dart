import 'package:account_book_app/model/saving_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show DateFormat, NumberFormat;
import '../../../component/saving/data_card.dart';
import '../../../component/saving/target_card.dart';
import '../../../provider/general_provider.dart';
import 'saving_add.dart';

class SavingData extends HookConsumerWidget {
  const SavingData({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(usersControllerProvider);
    final size = MediaQuery.of(context).size;
    final savingState = ref.watch(savingControllerProvider);
    final savingController = ref.watch(savingControllerProvider.notifier);

    final savingPrice = savingState.isNotEmpty
        ? savingState
            .map((e) => e.price)
            .toList()
            .reduce((value, element) => value + element)
        : 0;

    final targetPrice = usersState!.targetPrice;

    final priceParsent = (savingPrice / targetPrice * 100).toStringAsFixed(1);

    return Stack(
      children: [
        SizedBox(
          height: size.height,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            "あなた",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            "家族",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          child: Text(
                            "カップル",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    TargetCard(
                      title: '目標',
                      subTitle: usersState!.target,
                    ),
                    DataCard(
                      title: '目標金額',
                      subTitle: NumberFormat("#,###").format(targetPrice),
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
                      title: '節約総金額',
                      subTitle: NumberFormat("#,###").format(savingPrice),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: Theme.of(context).textTheme.bodyText2,
                        children: [
                          TextSpan(
                            text: '達成率：',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: priceParsent,
                            style: TextStyle(
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: '%',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 80),
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
              width: 170,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.lightBlueAccent,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.savings_outlined,
                    size: 40,
                    color: Colors.white,
                  ),
                  Text(
                    "節約できた",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
