import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../model/user/users_state.dart';
import '../../../../view_model/target_init_controller.dart';
import '../../../theme/app_text_theme.dart';

class FriendTileWithRadio extends HookConsumerWidget {
  const FriendTileWithRadio({
    super.key,
    required this.usersState,
  });
  final UsersState usersState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectFlg = useState(false);
    final targetInitCTL =
        ref.watch(targetInitControllerProvider(null).notifier);
    final font = ref.watch(myTextTheme);

    return InkWell(
      onTap: () {
        selectFlg.value = !selectFlg.value;
        if (selectFlg.value) {
          targetInitCTL.addMember(usersState);
        } else {
          targetInitCTL.removeMember(usersState);
        }
      },
      child: Padding(
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
                style: font.fs16.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
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
      ),
    );
  }
}
