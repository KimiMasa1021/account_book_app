import 'package:account_book_app/view/routes/app_route.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../component/account/account_appbar.dart';
import '../../../component/account/account_pie_chart.dart';
import '../../../component/account/expend_bar.dart';
import '../../../component/account/expend_child_bar.dart';
import '../../../component/account/income_expend_swicher.dart';
import '../../../provider/general_provider.dart';

class AccountPage extends HookConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final genreController = ref.watch(genreControllerProvider.notifier);
    final genreState = ref.watch(genreControllerProvider);

    final accountController = ref.watch(accountControllerPrvider.notifier);
    final accountState = ref.watch(accountControllerPrvider);

    final iESwicherState = ref.watch(incomeExpendSwicherProvider);
    final iESwicherController = ref.watch(incomeExpendSwicherProvider.notifier);
    return accountState.when(
      data: (state) {
        List<int> priceList = state.map((e) => e.price).toList();
        int price = priceList.isNotEmpty
            ? priceList.reduce((value, element) => value + element)
            : 0;

        return SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  AccountAppBar(
                    expend: price,
                    income: price,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        width: double.infinity,
                        child: iESwicherState
                            ? Column(
                                children: [
                                  const IncomeExpendSwicher(),
                                  const SizedBox(height: 10),
                                  AccountPieChart(state: state),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Column(
                                      children: [
                                        const Divider(
                                          height: 3,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(height: 20),
                                        SizedBox(
                                          height: 60 *
                                              (state.length.toDouble() +
                                                  genreState!.genre.length),
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: genreState.genre.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return ExpendChildBar(
                                                list: state
                                                    .where((state) =>
                                                        state.type ==
                                                            genreState
                                                                .genre.keys
                                                                .elementAt(
                                                                    index) &&
                                                        state.price > 0)
                                                    .toList(),
                                                title: genreState.genre.values
                                                    .elementAt(index),
                                                color: Colors.red,
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 40)
                                ],
                              )
                            : Column(
                                children: [
                                  const IncomeExpendSwicher(),
                                  const SizedBox(height: 10),
                                  AccountPieChart(state: state),
                                  const SizedBox(height: 10),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Column(
                                      children: [
                                        const Divider(
                                          height: 3,
                                          color: Colors.grey,
                                        ),
                                        const SizedBox(height: 20),
                                        SizedBox(
                                          height: 60 *
                                              (state.length.toDouble() +
                                                  genreState!.genre2.length),
                                          child: ListView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: genreState.genre2.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return ExpendChildBar(
                                                list: state
                                                    .where((state) =>
                                                        state.type ==
                                                            genreState
                                                                .genre2.keys
                                                                .elementAt(
                                                                    index) &&
                                                        state.price < 0)
                                                    .toList(),
                                                title: genreState.genre2.values
                                                    .elementAt(index),
                                                color: Colors.green,
                                              );
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 40)
                                ],
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                right: 10,
                bottom: 15,
                child: InkWell(
                  onTap: () {
                    AutoRouter.of(context).push(const AccountAdd());
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.lightBlueAccent,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.add,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              )
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
