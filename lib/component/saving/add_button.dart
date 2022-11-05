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

    final flg = useState(false);

    return flg.value
        ? InkWell(
            onTap: () {
              flg.value = false;
              memberListsCNT.state.remove(state);
            },
            child: Container(
              width: 90,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.black,
                  width: 4,
                ),
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Center(
                child: Text(
                  "キャンセル",
                  style: TextStyle(
                    fontSize: 15,
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
              memberListsCNT.state.add(state);
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
