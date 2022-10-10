import 'package:account_book_app/view/pages/account/account_content.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../component/account/account_appbar.dart';
import '../../../provider/general_provider.dart';
import 'account_add.dart';
import 'package:intl/intl.dart' show DateFormat, NumberFormat;

class AccountPage extends HookConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersState = ref.watch(usersControllerProvider);
    final test = ref.watch(testPrivider(10));
    final test2 = ref.watch(testPrivider(100));
    debugPrint("test" + test.toString());
    debugPrint("test2" + test2.toString());

    return ref.watch(processingPriceProvider).when(
      data: (state) {
        return DefaultTabController(
          length: 2,
          initialIndex: 1,
          child: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    AccountAppBar(
                      expend: state.expend,
                      income: state.income,
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          AccountContent(
                            state: state.incomeState,
                            genre: usersState!.genre2,
                            income: state.income,
                            expend: state.expend,
                            fontColor: Colors.green,
                          ),
                          AccountContent(
                            state: state.expendState,
                            genre: usersState.genre,
                            income: state.income,
                            expend: state.expend,
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
