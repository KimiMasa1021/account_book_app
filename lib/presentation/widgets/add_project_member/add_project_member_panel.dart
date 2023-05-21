import 'package:account_book_app/application/providers/add_project_member_provider/provider/add_project_member_provider.dart';
import 'package:account_book_app/application/providers/profile_notifier_provider/state/profile.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../common/theme/app_text_theme.dart';

class AddProjectMemberPanel extends ConsumerWidget {
  const AddProjectMemberPanel({
    super.key,
    required this.profile,
  });
  final Profile profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final addProjectMember = ref.watch(addProjectMemberProvider);
    final addProjectMemberCTL = ref.watch(addProjectMemberProvider.notifier);

    return InkWell(
      onTap: () => addProjectMemberCTL.setMember(profile),
      child: Container(
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
            Checkbox(
              value: addProjectMember.contains(profile),
              onChanged: (val) => addProjectMemberCTL.setMember(profile),
            ),
          ],
        ),
      ),
    );
  }
}
