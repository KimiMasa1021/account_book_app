import 'package:account_book_app/view/pages/account/account_genre.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../provider/general_provider.dart';

class GenrePanel extends HookConsumerWidget {
  const GenrePanel({
    required this.isShow,
    required this.genreController,
    super.key,
  });
  final ValueNotifier<bool> isShow;
  final TextEditingController genreController;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final addPageState = ref.watch(usersControllerProvider);
    final iESwicherState = ref.watch(incomeExpendSwicherProvider);
    final expendState = ref.watch(expendControllerProvider);
    final incomeState = ref.watch(incomeControllerProvider);

    return isShow.value
        ? Align(
            alignment: const Alignment(0, 1),
            child: SizedBox(
              width: double.infinity,
              height: size.height / 2.4,
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    color: Colors.blue,
                    height: 50,
                    child: Row(
                      children: [
                        const SizedBox(width: 20),
                        const Text(
                          "分類",
                          style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(AccountGenre.id);
                          },
                          child: const Icon(
                            Icons.edit_note_rounded,
                            size: 40,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 10),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        color: Colors.white,
                        width: size.width,
                        height: size.height / 2.4 - 50,
                        child: GridView.builder(
                          itemCount: iESwicherState
                              ? expendState.length
                              : incomeState.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                          ),
                          itemBuilder: (BuildContext context, int index) =>
                              InkWell(
                            onTap: () {
                              genreController.text = iESwicherState
                                  ? expendState[index].name
                                  : incomeState[index].name;
                              FocusScope.of(context).nextFocus();
                              isShow.value = false;
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                  top: 10, left: 5, right: 5, bottom: 0),
                              decoration: BoxDecoration(
                                  border: Border.all(),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(10))),
                              child: Center(
                                child: Text(
                                  iESwicherState
                                      ? expendState[index].name
                                      : incomeState[index].name,
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
