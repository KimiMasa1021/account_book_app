import 'dart:math';

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
    final genreController = ref.watch(genreControllerProvider.notifier);
    final genreState = ref.watch(genreControllerProvider)!.genre;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        height: 260,
        width: double.infinity,
        child: Stack(
          children: [
            PieChart(
              PieChartData(
                sections: List<PieChartSectionData>.generate(
                  genreState.length,
                  (index) {
                    final genreList = state
                        .where((state) =>
                            state.type == genreState.keys.elementAt(index) &&
                            state.price > 0)
                        .toList();
                    List<int> priceList =
                        genreList.map((e) => e.price).toList();
                    return PieChartSectionData(
                      title: genreState.values.elementAt(index),
                      value: priceList.isNotEmpty
                          ? priceList
                              .reduce((value, element) => value + element)
                              .toDouble()
                          : 0,
                      radius: 30,
                      color: Color(
                        (Random().nextDouble() * 0xFFFFFF).toInt() << 0,
                      ).withOpacity(1.0),
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
