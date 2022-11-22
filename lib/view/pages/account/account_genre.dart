import 'package:account_book_app/provider/general_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../component/account/income_expend_swicher.dart';
import 'account_genre_add.dart';

class AccountGenre extends HookConsumerWidget {
  const AccountGenre({super.key});
  static const String id = "account_genre";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iESwicherState = ref.watch(incomeExpendSwicherProvider);
    final expendState = ref.watch(expendControllerProvider);
    final incomeState = ref.watch(incomeControllerProvider);

    final expendController = ref.watch(expendControllerProvider.notifier);
    final incomeController = ref.watch(incomeControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "分類の追加",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(AccountGenreAdd.id);
            },
            child: Row(
              children: const [
                Icon(
                  Icons.add,
                  color: Colors.black,
                ),
                Text(
                  "追加する",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                SizedBox(width: 10)
              ],
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const IncomeExpendSwicher(),
            const SizedBox(height: 10),
            Expanded(
              child: ReorderableListView(
                padding: const EdgeInsets.all(10.0),
                onReorder: (int oldIndex, int newIndex) async {
                  if (oldIndex < newIndex) {
                    newIndex--;
                  }

                  await expendController.updateSeq(
                      expendState[newIndex], expendState[oldIndex]);
                },
                children: List.generate(
                  iESwicherState ? expendState.length : incomeState.length,
                  (index) => Container(
                    key: Key(iESwicherState
                        ? expendState[index].docId
                        : incomeState[index].docId),
                    height: 50,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border(
                        bottom: BorderSide(
                          width: 0.5,
                        ),
                        top: BorderSide(
                          width: 0.5,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.drag_handle,
                          color: Colors.grey,
                        ),
                        const SizedBox(width: 7),
                        Expanded(
                          child: Text(
                            iESwicherState
                                ? expendState[index].name
                                : incomeState[index].name,
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            iESwicherState
                                ? expendController
                                    .deleteExpend(expendState[index].docId)
                                : incomeController
                                    .deleteIncome(incomeState[index].docId);
                          },
                          child: const Icon(
                            Icons.delete_outline,
                            color: Colors.redAccent,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
