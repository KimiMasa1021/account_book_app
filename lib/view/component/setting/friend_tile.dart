import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../model/user/users_state.dart';
import '../../theme/app_theme.dart';

class FriendTile extends HookConsumerWidget {
  const FriendTile({
    super.key,
    required this.usersState,
  });
  final UsersState usersState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

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
        ],
      ),
    );
  }
}
