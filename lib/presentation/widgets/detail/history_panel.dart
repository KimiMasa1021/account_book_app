import 'package:account_book_app/application/providers/profile_notifier_provider/state/profile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../view/theme/app_text_theme.dart';

class HistoryPanel extends ConsumerWidget {
  const HistoryPanel({
    super.key,
    required this.profile,
  });
  final Profile profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "タバコを我慢した！",
                style: font.fs19.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "600円",
                style: font.fs19.copyWith(
                  fontWeight: FontWeight.bold,
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
                "14:22",
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
  }
}
