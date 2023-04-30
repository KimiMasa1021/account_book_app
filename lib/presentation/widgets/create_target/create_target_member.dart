import 'package:account_book_app/application/providers/search_user_provider/provider/search_user_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../application/providers/profile_notifier_provider/provider/profile_notifier_provider.dart';
import '../../../view/theme/app_text_theme.dart';
import '../common/select_member_panel.dart';

class CreateTargetMember extends ConsumerWidget {
  const CreateTargetMember({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final size = MediaQuery.of(context).size;
    final profile = ref.watch(profileNotifierProvider);
    final searchUser = ref.watch(searchUserNotifierProvider(profile.friends));
    return searchUser.when(
      data: (data) {
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
                  child: Row(
                    children: [
                      SelectMemberPanel(
                        profile: profile,
                        isMyProfile: true,
                      ),
                      ...List.generate(
                        data.length,
                        (index) => SelectMemberPanel(
                          profile: data[index],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
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
