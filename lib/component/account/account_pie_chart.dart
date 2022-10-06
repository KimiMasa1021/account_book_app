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
    final genreState = ref.watch(usersControllerProvider);
    final iESwicherState = ref.watch(incomeExpendSwicherProvider);
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.width / 2.3,
      width: size.width / 2.3,
      child: PieChart(
        PieChartData(
          sections: List.generate(
            iESwicherState
                ? genreState!.genre.length
                : genreState!.genre2.length,
            (index) {
              final genreList = iESwicherState
                  ? state
                      .where((state) =>
                          state.type == genreState.genre.keys.elementAt(index))
                      .toList()
                  : state
                      .where((state) =>
                          state.type == genreState.genre2.keys.elementAt(index))
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
                radius: 40,
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
    );
  }
}
