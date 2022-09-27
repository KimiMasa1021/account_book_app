import 'dart:math';

import 'package:account_book_app/constant/color_type.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/account_state.dart';
import '../../provider/general_provider.dart';

class AccountPieChart extends HookConsumerWidget {
  const AccountPieChart({required this.state, super.key});
  final List<AccountState> state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final genreState = ref.watch(genreControllerProvider);
    final iESwicherState = ref.watch(incomeExpendSwicherProvider);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        height: 260,
        width: double.infinity,
        child: Stack(
          children: [
            PieChart(
              PieChartData(
                sections: List.generate(
                  state.length,
                  (index) {
                    final genreList = iESwicherState
                        ? state
                            .where((state) =>
                                state.type ==
                                genreState!.genre.keys.elementAt(index))
                            .toList()
                        : state
                            .where((state) =>
                                state.type ==
                                genreState!.genre2.keys.elementAt(index))
                            .toList();
                    double priceList = genreList.isNotEmpty
                        ? genreList
                            .map((e) => e.price)
                            .toList()
                            .reduce((a, b) => a + b)
                            .toDouble()
                        : 0;
                    return PieChartSectionData(
                      title: "",
                      value: priceList,
                      radius: 20,
                      color: colorType[index],
                      titleStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    );
                  },
                ),
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
