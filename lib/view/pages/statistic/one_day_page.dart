import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../../../component/statistics/one_day_appbar.dart';
import '../../../component/statistics/one_day_panel.dart';
import '../../../provider/general_provider.dart';

class OneDayPage extends HookConsumerWidget {
  const OneDayPage({required this.setDate, super.key});
  final ValueNotifier<DateTime> setDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    debugPrint(setDate.value.day.toString());
    return ref.watch(processingPriceProvider(setDate.value)).when(
      data: (state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(height: 120),
                  Expanded(
                    child: ScrollablePositionedList.builder(
                      shrinkWrap: true,
                      initialScrollIndex: setDate.value.day - 1,
                      itemCount: DateTime(
                              setDate.value.year, setDate.value.month + 1, 0)
                          .day,
                      itemBuilder: (context, index) {
                        return OneDayPanel(
                          day: (index + 1).toString(),
                          list: state.monthlyState
                              .where((val) => val.registeTime.day == index + 1)
                              .toList(),
                          index: index,
                          setDate: setDate,
                        );
                      },
                    ),
                  ),
                ],
              ),
              OneDayAppBar(
                setDate: setDate,
                expend: state.expend,
                income: state.income,
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) {
        return const Center(
          child: Text("えらーですねぇえ"),
        );
      },
      loading: () {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
