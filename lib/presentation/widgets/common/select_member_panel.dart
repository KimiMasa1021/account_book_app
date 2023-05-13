import 'package:account_book_app/application/providers/profile_notifier_provider/state/profile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../application/providers/create_target_provider/provider/create_target_provider.dart';
import '../../../common/theme/app_text_theme.dart';

class SelectMemberPanel extends ConsumerWidget {
  const SelectMemberPanel({
    super.key,
    required this.profile,
    this.isMyProfile = false,
  });
  final Profile profile;
  final bool isMyProfile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final createTarget = ref.watch(createTargetNotifierProvider);
    final createTargetCTL = ref.watch(createTargetNotifierProvider.notifier);
    final isContained =
        createTarget.members.map((e) => e.uid).contains(profile.uid);
    return InkWell(
      onTap: () {
        if (isMyProfile) return;
        createTargetCTL.setMember(profile);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 55,
                  height: 55,
                  margin: const EdgeInsets.only(bottom: 5),
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
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: const Offset(0, 0),
                        blurRadius: 6,
                      )
                    ],
                    border: isContained || isMyProfile
                        ? Border.all(
                            width: 3,
                            color: Theme.of(context).colorScheme.tertiary,
                          )
                        : null,
                  ),
                ),
                isContained || isMyProfile
                    ? Positioned(
                        right: -5,
                        top: -5,
                        child: Container(
                          width: 25,
                          height: 25,
                          margin: const EdgeInsets.only(bottom: 5),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.check,
                              color: Theme.of(context).colorScheme.onTertiary,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            Text(
              isMyProfile ? "あなた" : profile.name,
              style: font.fs16.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            )
          ],
        ),
      ),
    );
  }
}
