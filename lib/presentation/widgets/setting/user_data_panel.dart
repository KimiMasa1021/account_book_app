import 'package:account_book_app/application/providers/profile_notifier_provider/provider/profile_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../view/theme/app_text_theme.dart';

class UserDataPanel extends ConsumerWidget {
  const UserDataPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(profileNotifierProvider);
    final font = ref.watch(myTextTheme);

    return InkWell(
      onTap: () {
        // context.pushNamed(Routes.name().accountManagement);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onBackground,
                borderRadius: BorderRadius.circular(10),
                image: profile.img != ""
                    ? DecorationImage(
                        image: NetworkImage(
                          profile.img,
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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.name,
                    style: font.fs16.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    profile.email,
                    style: font.fs16,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Theme.of(context).colorScheme.onBackground,
            ),
          ],
        ),
      ),
    );
  }
}