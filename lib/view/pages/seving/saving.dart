import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Saving extends StatelessWidget {
  const Saving({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 4,
                    ),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    child: Center(
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
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 4,
                    ),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        // color: Colors.grey,
                        // borderRadius: BorderRadius.all(
                        //   Radius.circular(50),
                        // ),
                        ),
                    child: Center(
                      child: Text(
                        "家族",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.group_add_outlined,
                    size: 30,
                  )
                ],
              ),
              Container(
                width: double.infinity,
                height: 100,
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "目標",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 88, 88, 88),
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
              Container(
                width: double.infinity,
                height: 300,
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: LineChart(
                  LineChartData(lineBarsData: [LineChartBarData()]),
                  swapAnimationDuration:
                      const Duration(milliseconds: 150), // Optional
                  swapAnimationCurve: Curves.linear, // Optional
                ),
              ),
              Container(
                width: double.infinity,
                height: 100,
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "目標金額",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 88, 88, 88),
                      ),
                    ),
                    Text(
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
                margin: EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "節約総金額",
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 88, 88, 88),
                      ),
                    ),
                    Text(
                      "３８０，０００円",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("達成率：45%"),
                  Text("拙訳履歴"),
                ],
              ),
              SizedBox(height: 8),
              Divider(
                color: Colors.grey,
                height: 3,
                thickness: 0.7,
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("繰り返し節約品目"),
                  Text("追加する"),
                ],
              ),
              SizedBox(height: 8),
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Row(
                  children: [
                    Text("ジュース"),
                    Spacer(),
                    Text("毎日"),
                    Text("170円"),
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
