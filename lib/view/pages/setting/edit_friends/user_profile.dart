import 'package:account_book_app/model/user/users_state.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../theme/app_text_theme.dart';

class UserProfile extends ConsumerWidget {
  const UserProfile({
    super.key,
    required this.friendState,
  });
  final UsersState friendState;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 30,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 90,
                  height: 90,
                  margin: const EdgeInsets.only(
                    top: 20,
                    bottom: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onBackground,
                    borderRadius: BorderRadius.circular(10),
                    image: friendState.img != ""
                        ? DecorationImage(
                            image: NetworkImage(
                              friendState.img,
                            ),
                          )
                        : null,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(0, 0),
                        blurRadius: 6,
                      )
                    ],
                  ),
                ),
                Text(
                  friendState.name,
                  style: font.fs21.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 12,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: Icon(
                            Icons.person_add,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                        Text(
                          "フレンド追加",
                          style: font.fs16.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onSecondary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
