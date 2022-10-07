import 'package:flutter/material.dart';
import '../../../component/account/account_pie_chart.dart';
import '../../../component/account/expend_child_bar.dart';
import '../../../model/account_state.dart';
import 'package:intl/intl.dart' show DateFormat, NumberFormat;

class AccountContent extends StatelessWidget {
  const AccountContent({
    super.key,
    required this.state,
    required this.genre,
    required this.income,
    required this.expend,
    required this.fontColor,
  });

  final List<AccountState> state;
  final Map<String, String> genre;
  final int income;
  final int expend;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AccountPieChart(
                    state: state,
                    genre: genre,
                  ),
                  Container(
                    width: size.width / 1.9,
                    padding: const EdgeInsets.only(right: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "収入",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              NumberFormat("#,###").format(income),
                              style: const TextStyle(
                                color: Colors.lightGreen,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "支出",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              NumberFormat("#,###").format(expend * -1),
                              style: const TextStyle(
                                color: Colors.redAccent,
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "収支",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              NumberFormat("#,###").format(income + expend),
                              style: const TextStyle(
                                fontSize: 25,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 5),
              const Divider(
                color: Color.fromARGB(255, 65, 65, 65),
                thickness: 1,
              ),
              const SizedBox(height: 5),
              SizedBox(
                height: 2000,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: genre.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ExpendChildBar(
                      list: state
                          .where((state) =>
                              state.type == genre.keys.elementAt(index))
                          .toList(),
                      title: genre.values.elementAt(index),
                      color: fontColor,
                      index: index,
                    );
                  },
                ),
              ),
              const SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }
}
