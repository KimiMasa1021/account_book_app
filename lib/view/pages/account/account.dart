import 'package:account_book_app/model/users_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../component/account/account_appbar.dart';
import '../../../component/account/account_pie_chart.dart';
import '../../../component/account/expend_child_bar.dart';
import '../../../component/account/income_expend_swicher.dart';
import '../../../model/account_state.dart';
import '../../../provider/general_provider.dart';
import 'account_add.dart';

class AccountPage extends HookConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(usersControllerProvider);
    final accountState = ref.watch(accountControllerPrvider);
    final iESwicherState = ref.watch(incomeExpendSwicherProvider);
    final setDate = useState(DateTime.now());

    return accountState.when(
      data: (state) {
        List<AccountState> expendState = state.isNotEmpty
            ? state
                .where(
                  (p) =>
                      p.price < 0 &&
                      p.registeTime.month == setDate.value.month &&
                      p.registeTime.year == setDate.value.year,
                )
                .toList()
            : [];
        List<AccountState> incomeState = state.isNotEmpty
            ? state
                .where(
                  (p) =>
                      p.price > 0 &&
                      p.registeTime.month == setDate.value.month &&
                      p.registeTime.year == setDate.value.year,
                )
                .toList()
            : [];
        List<int> priceList = state
            .where(
              (e) =>
                  e.registeTime.month == setDate.value.month &&
                  e.registeTime.year == setDate.value.year,
            )
            .map((a) => a.price)
            .toList();
        int expend = expendState.isNotEmpty
            ? priceList
                .where((p) => p < 0)
                .toList()
                .reduce((value, element) => value + element)
            : 0;
        int income = incomeState.isNotEmpty
            ? priceList
                .where((p) => p > 0)
                .toList()
                .reduce((value, element) => value + element)
            : 0;
        return SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  AccountAppBar(
                    expend: expend,
                    income: income,
                    setDate: setDate,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          children: [
                            const IncomeExpendSwicher(),
                            const SizedBox(height: 10),
                            AccountPieChart(
                              state: iESwicherState ? expendState : incomeState,
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                            usersState!.genre.length),
                                    child: ListView.builder(
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: iESwicherState
                                          ? usersState.genre.length
                                          : usersState.genre2.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return ExpendChildBar(
                                          list: iESwicherState
                                              ? expendState
                                                  .where((state) =>
                                                      state.type ==
                                                          usersState.genre.keys
                                                              .elementAt(
                                                                  index) &&
                                                      state.price < 0)
                                                  .toList()
                                              : incomeState
                                                  .where((state) =>
                                                      state.type ==
                                                          usersState.genre2.keys
                                                              .elementAt(
                                                                  index) &&
                                                      state.price > 0)
                                                  .toList(),
                                          title: iESwicherState
                                              ? usersState.genre.values
                                                  .elementAt(index)
                                              : usersState.genre2.values
                                                  .elementAt(index),
                                          color: iESwicherState
                                              ? Colors.red
                                              : Colors.green,
                                          index: index,
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
                    Navigator.of(context).pushNamed(AccountAdd.id);
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
