import 'package:account_book_app/provider/general_provider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccountPage extends HookConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authController = ref.watch(authControllerProvider.notifier);
    return SafeArea(
      child: Column(
        children: [
          Container(
            height: 95,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1.0,
                  blurRadius: 10.0,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.arrow_left,
                      size: 50,
                    ),
                    Text(
                      "2022年9月",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    Icon(
                      Icons.arrow_right,
                      size: 50,
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: const [
                        Text("収入"),
                        Text(
                          "450,000",
                          style: TextStyle(
                            color: Colors.lightGreen,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Text("収入"),
                        Text(
                          "450,000",
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: const [
                        Text("収入"),
                        Text("450,000"),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10),
                      width: 180,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                height: double.infinity,
                                decoration: const BoxDecoration(
                                  color: Colors.lightGreen,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(100),
                                    bottomLeft: Radius.circular(100),
                                  ),
                                ),
                                child: const Center(
                                  child: Text("支出"),
                                ),
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Center(
                              child: Text("収入"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
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
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          const Divider(
                            height: 3,
                            color: Colors.grey,
                          ),
                          const SizedBox(height: 20),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.black12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 1.0,
                                  blurRadius: 2.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            width: double.infinity,
                            height: 60,
                            child: InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: const [
                                    Text(
                                      "支出",
                                      style: TextStyle(
                                        fontSize: 25,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                      "120,000",
                                      style: TextStyle(
                                        fontSize: 25,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios_outlined,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 1.0,
                                  blurRadius: 2.0,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            width: double.infinity,
                            height: 50,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    width: 14,
                                    height: 14,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                    ),
                                  ),
                                  Text(
                                    "食費",
                                    style: TextStyle(
                                      fontSize: 23,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    "10,000",
                                    style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.redAccent,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
