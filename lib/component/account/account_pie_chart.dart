import 'package:account_book_app/constant/color_type.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/account_state.dart';
import '../../provider/general_provider.dart';

class AccountPieChart extends HookConsumerWidget {
  const AccountPieChart({
    required this.state,
    super.key,
    required this.genre,
  });
  final List<AccountState> state;
  final Map<String, String> genre;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.width / 2.3,
      width: size.width / 2.3,
      child: PieChart(
        PieChartData(
          sections: List.generate(
            genre.length,
            (index) {
              final genreList = state
                  .where((state) => state.type == genre.keys.elementAt(index))
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
