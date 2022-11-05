import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/users_state.dart';
import '../../provider/general_provider.dart';

class MemberButton extends HookConsumerWidget {
  const MemberButton({
    super.key,
    required this.state,
  });
  final UsersState state;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memberLists = ref.watch(memberListProvider);
    final memberListsCNT = ref.watch(memberListProvider.notifier);

    final flg = useState(memberLists.contains(state));

    return memberLists.contains(state)
        ? InkWell(
            onTap: () {
              flg.value = false;
              memberListsCNT.state =
                  memberLists.where((e) => e != state).toList();
            },
            child: Container(
              width: 90,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                child: Text(
                  "削除",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          )
        : InkWell(
            onTap: () {
              flg.value = true;

              memberListsCNT.state = [...memberLists, state];
            },
            child: Container(
              width: 90,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                child: Text(
                  "追加",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
  }
}
