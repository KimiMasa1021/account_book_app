import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class AccountPieChart extends StatelessWidget {
  const AccountPieChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        height: 260,
        width: double.infinity,
        child: Stack(
          children: [
            PieChart(
              PieChartData(
                sections: [
                  PieChartSectionData(
                    title: '',
                    value: 30,
                    radius: 30,
                    color: Colors.red,
                    titleStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                    ),
                  ),
                  PieChartSectionData(
                    title: '',
                    value: 30,
                    radius: 30,
                    color: Colors.orangeAccent,
                    titleStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                  PieChartSectionData(
                    title: '',
                    value: 40,
                    radius: 30,
                    color: Colors.purple,
                    titleStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            const Align(
              alignment: Alignment(0, -0.5),
              child: Text(
                "9月の節約",
                style: TextStyle(fontSize: 25),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Text(
                "5,000円",
                style: TextStyle(fontSize: 45),
              ),
            )
          ],
        ),
      ),
    );
  }
}
