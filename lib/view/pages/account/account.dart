import 'package:account_book_app/view/pages/account/account_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../component/account/account_appbar.dart';
import '../../../model/account_state.dart';
import '../../../provider/general_provider.dart';
import 'account_add.dart';
import 'package:intl/intl.dart' show DateFormat, NumberFormat;

class AccountPage extends HookConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(usersControllerProvider);
    final accountState = ref.watch(accountControllerPrvider);
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
        return DefaultTabController(
          length: 2,
          initialIndex: 1,
          child: SafeArea(
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
                      child: TabBarView(
                        children: [
                          AccountContent(
                            state: incomeState,
                            genre: usersState!.genre2,
                            income: income,
                            expend: expend,
                            fontColor: Colors.green,
                          ),
                          AccountContent(
                            state: expendState,
                            genre: usersState.genre,
                            income: income,
                            expend: expend,
                            fontColor: Colors.red,
                          ),
                        ],
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
