import 'package:account_book_app/model/genre.dart';
import 'package:account_book_app/provider/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../component/account/account_pie_chart.dart';
import '../../../component/account/expend_child_bar.dart';
import '../../../model/account_state.dart';

class AccountContent extends HookConsumerWidget {
  const AccountContent({
    super.key,
    required this.state,
    required this.genre,
    required this.income,
    required this.expend,
    required this.fontColor,
  });

  final List<AccountState> state;
  final List<Genre> genre;
  final int income;
  final int expend;
  final Color fontColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountProvider = ref.watch(accountControllerPrvider.notifier);
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
                              accountProvider.pFormat(income),
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
                              accountProvider.pFormat(expend * -1),
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
                              accountProvider.pFormat(income + expend),
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
              const SizedBox(height: 10),
              SizedBox(
                height: 2000,
                child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: genre.length,
                  itemBuilder: (BuildContext context, int index) {
                    debugPrint(genre.length.toString());
                    return ExpendChildBar(
                      list: state
                          .where((state) => state.type == genre[index].name)
                          .toList(),
                      title: genre[index].name,
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
