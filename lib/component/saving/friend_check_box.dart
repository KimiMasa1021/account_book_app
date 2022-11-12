import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../model/users_state.dart';

class FriendCheckBox extends HookConsumerWidget {
  const FriendCheckBox({
    super.key,
    required this.friendList,
    required this.uid,
  });
  final ValueNotifier<List<String>> friendList;
  final String uid;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final flg = useState(false);
    return Checkbox(
      value: flg.value,
      onChanged: (val) {
        flg.value = val!;
        if (flg.value == true) {
          friendList.value = [...friendList.value, uid];
        } else {
          friendList.value = friendList.value.where((e) => e != uid).toList();
        }
      },
    );
  }
}
