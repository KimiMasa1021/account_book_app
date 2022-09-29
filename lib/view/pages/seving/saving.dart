import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Saving extends StatelessWidget {
  const Saving({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 4,
                    ),
                    margin: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "あなた",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 4,
                    ),
                    margin: const EdgeInsets.only(right: 10),
                    decoration: const BoxDecoration(),
                    child: const Center(
                      child: Text(
                        "家族",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.group_add_outlined,
                    size: 30,
                  )
                ],
              ),
              Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.only(top: 13),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "目標",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Text(
                      "新しいパソコンの購入",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              AspectRatio(
                aspectRatio: 1.35,
                child: Container(
                  margin: const EdgeInsets.only(top: 13),
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
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
                            getTitlesWidget: (value, meta) => const Text("*"),
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
                    swapAnimationDuration: const Duration(milliseconds: 150),
                    swapAnimationCurve: Curves.linear,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.only(top: 13),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "目標金額",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 88, 88, 88),
                      ),
                    ),
                    const Text(
                      "４００、０００円",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                margin: const EdgeInsets.only(top: 13),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "節約総金額",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 88, 88, 88),
                      ),
                    ),
                    const Text(
                      "３８０，０００円",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("達成率：45%"),
                  const Text("節約履歴"),
                ],
              ),
              const SizedBox(height: 8),
              const Divider(
                color: Colors.grey,
                height: 3,
                thickness: 0.7,
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("繰り返し節約品目"),
                  const Text("追加する"),
                ],
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 50,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    const Text("ジュース"),
                    const Spacer(),
                    const Text("毎日"),
                    const Text("170円"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
