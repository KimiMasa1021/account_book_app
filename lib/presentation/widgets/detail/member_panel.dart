import 'package:account_book_app/application/providers/profile_notifier_provider/state/profile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../view/theme/app_text_theme.dart';

class MemberPanel extends ConsumerWidget {
  const MemberPanel({
    super.key,
    required this.profile,
  });
  final Profile profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);

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
          Text(
            "50,000円",
            style: font.fs19.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
