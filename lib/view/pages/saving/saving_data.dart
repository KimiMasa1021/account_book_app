import 'package:account_book_app/component/saving/add_buttom.dart';
import 'package:account_book_app/component/saving/member_list_panel.dart';
import 'package:account_book_app/component/saving/target_bar.dart';
import 'package:account_book_app/view/pages/saving/saving_history.dart';
import 'package:account_book_app/view/pages/saving/saving_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart' show NumberFormat;
import '../../../component/saving/achieve_rate.dart';
import '../../../component/saving/data_card.dart';
import '../../../component/saving/history_button.dart';
import '../../../component/saving/price_chart.dart';
import '../../../component/saving/target_card.dart';
import '../../../model/saving_state.dart';
import '../../../provider/general_provider.dart';
import '../../../repository/friends_repository.dart';
import '../../../repository/saving_repository.dart';
import 'saving_add.dart';
import 'package:confetti/confetti.dart';

class SavingData extends HookConsumerWidget {
  const SavingData({super.key});
  List<int> increaseRate(List<int> list) {
    List<int> increaseRate = [];

    for (int x = 0; x < list.length; x++) {
      if (x == 0) {
        increaseRate.add(list[x]);
      } else {
        increaseRate.add(increaseRate[x - 1] + list[x]);
      }
    }

    return increaseRate;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final savingState = ref.watch(savingControllerProvider);
    final selectedSaving = useState(0);
    final _controller =
        ConfettiController(duration: const Duration(seconds: 1000));
    _controller.play();

    return SizedBox(
      height: size.height,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                TargetBar(selectedSaving: selectedSaving),
                StreamBuilder(
                  stream: ref.read(savingRepositoryProvider).feachList(
                        savingState[selectedSaving.value].id,
                      ),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      final List<SavingState> state =
                          snapshot.data!.map((e) => e.data()).toList();
                      final savingPrice = state.isNotEmpty
                          ? state
                              .map((e) => e.price)
                              .toList()
                              .reduce((value, element) => value + element)
                          : 0;
                      final targetPrice =
                          savingState[selectedSaving.value].targetPrice;
                      final priceParsent = (savingPrice / targetPrice * 100);
                      final List<int> savingChartList = state.isNotEmpty
                          ? increaseRate(
                              state.map((e) => e.price).toList(),
                            )
                          : [];
                      return Stack(
                        children: [
                          Column(
                            children: [
                              TargetCard(
                                title: '目標',
                                subTitle:
                                    savingState[selectedSaving.value].target,
                              ),
                              DataCard(
                                  title: '目標金額',
                                  subTitle: NumberFormat("#,###").format(
                                      savingState[selectedSaving.value]
                                          .targetPrice)),
                              AddButton(
                                title: "節約記録を追加",
                                function: () {
                                  Navigator.of(context).pushNamed(
                                    SavingAdd.id,
                                    arguments:
                                        savingState[selectedSaving.value].id,
                                  );
                                },
                              ),
                              DataCard(
                                title: '現在の節約総金額',
                                subTitle:
                                    NumberFormat("#,###").format(savingPrice),
                              ),
                              Row(
                                children: [
                                  AchieveRate(
                                    title: "達成率",
                                    parsent: priceParsent,
                                  ),
                                  HistoryButton(
                                    title: '履歴',
                                    fucntion: () {
                                      Navigator.of(context).pushNamed(
                                        SavingHistory.id,
                                        arguments: state,
                                      );
                                    },
                                  ),
                                ],
                              ),
                              PriceChart(
                                savingChartList: savingChartList,
                              ),
                              MemberListPanel(selectedSaving: selectedSaving),
                              const SizedBox(height: 80),
                            ],
                          ),
                          priceParsent >= 100
                              ? Align(
                                  alignment: Alignment.topRight,
                                  child: ConfettiWidget(
                                    confettiController: _controller,
                                  ),
                                )
                              : SizedBox(),
                        ],
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
