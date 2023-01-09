import 'package:account_book_app/model/users_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../provider/general_provider.dart';
import '../../theme/app_theme.dart';

class FriendTileWithRadio extends HookConsumerWidget {
  const FriendTileWithRadio({
    super.key,
    required this.usersState,
  });
  final UsersState usersState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final selectFlg = useState(false);
    final targetInit = ref.watch(targetInitControllerProvider);
    final targetInitCTL = ref.watch(targetInitControllerProvider.notifier);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  usersState.img,
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  offset: const Offset(0, 0),
                  blurRadius: 4,
                )
              ],
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              usersState.name,
              style: theme.textTheme.fs19,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Checkbox(
            value: selectFlg.value,
            onChanged: (val) {
              selectFlg.value = val!;
              if (val) {
                targetInitCTL.addMember(usersState);
              } else {
                targetInitCTL.removeMember(usersState);
              }
            },
          ),
        ],
      ),
    );
  }
}
