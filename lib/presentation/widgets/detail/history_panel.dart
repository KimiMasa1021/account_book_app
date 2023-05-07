import 'package:account_book_app/application/providers/saving_provider/state/saving_state.dart';
import 'package:account_book_app/application/providers/target_provider/state/target_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import '../../../application/providers/search_user_provider/provider/search_user_provider.dart';
import '../../../view/theme/app_text_theme.dart';

class HistoryPanel extends ConsumerWidget {
  const HistoryPanel({
    super.key,
    required this.savingState,
    required this.targetState,
  });
  final TargetState targetState;
  final SavingState savingState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final searchUser =
        ref.watch(searchUserNotifierProvider(targetState.members));

    return searchUser.when(
      data: (data) {
        final profile = data.singleWhere((e) => e.uid == savingState.userId);
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    savingState.tag,
                    style: font.fs19.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      style: font.fs16.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                      children: [
                        TextSpan(
                          text: savingState.price.toString(),
                          style: font.fs27.copyWith(
                            height: 0,
                          ),
                        ),
                        const TextSpan(
                          text: '円',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                      image: profile.img != ""
                          ? DecorationImage(
                              image: NetworkImage(
                                profile.img,
                              ),
                            )
                          : null,
                    ),
                  ),
                  Text(
                    profile.name,
                    style: font.fs16.copyWith(),
                  ),
                  const Spacer(),
                  Text(
                    DateFormat("HH:mm").format(savingState.createdAt),
                    style: font.fs16.copyWith(),
                  ),
                ],
              ),
              Divider(
                color: Theme.of(context).colorScheme.onBackground,
              ),
            ],
          ),
        );
      },
      error: (e, s) {
        return const SizedBox();
      },
      loading: () {
        return const SizedBox();
      },
    );
  }
}
