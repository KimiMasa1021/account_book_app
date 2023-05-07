import 'package:account_book_app/application/providers/profile_notifier_provider/state/profile.dart';
import 'package:account_book_app/application/providers/target_provider/state/target_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../application/providers/saving_provider/provider/saving_notifier_provider.dart';
import '../../../view/theme/app_text_theme.dart';

class MemberPanel extends ConsumerWidget {
  const MemberPanel({
    super.key,
    required this.profile,
    required this.targetState,
  });
  final Profile profile;
  final TargetState targetState;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final saving = ref.watch(savingNotifierProvider(targetState.productId));

    return saving.when(
      data: (data) {
        final priceList = data
            .where((element) => element.userId == profile.uid)
            .map((e) => e.price)
            .toList();
        final sum =
            priceList.isNotEmpty ? priceList.reduce((v, e) => v + e) : 0;

        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: [
              Container(
                width: 50,
                height: 50,
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
                style: font.fs19.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              RichText(
                text: TextSpan(
                  style: font.fs16.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                  children: [
                    TextSpan(
                      text: sum.toString(),
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
