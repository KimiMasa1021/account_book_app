import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../component/saving/add_button.dart';
import '../../../model/users_state.dart';
import '../../../provider/general_provider.dart';

class SavingMemberAdd2 extends HookConsumerWidget {
  const SavingMemberAdd2({super.key});
  static String id = "saving_member_add2";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friendsListState = ref.watch(friendsListControllerProvider);
    final args = ModalRoute.of(context)!.settings.arguments as List<UsersState>;
    final list = friendsListState.where((e) => !args.contains(e)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("フレンドを選択してください"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: list.length,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      border: Border.symmetric(
                        horizontal: BorderSide(
                          width: 0.3,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 65,
                          width: 65,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            shape: BoxShape.circle,
                            image: list[index].img != ""
                                ? DecorationImage(
                                    image: NetworkImage(list[index].img),
                                  )
                                : const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage("assets/img/profile.png"),
                                  ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                list[index].name,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                list[index].email,
                                overflow: TextOverflow.ellipsis,
                              )
                            ],
                          ),
                        ),
                        Checkbox(
                          value: true,
                          onChanged: (val) {},
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
