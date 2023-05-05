import 'package:account_book_app/application/providers/search_user_provider/provider/search_user_provider.dart';
import 'package:account_book_app/presentation/widgets/detail/member_panel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailMember extends ConsumerWidget {
  const DetailMember({
    super.key,
    required this.memberList,
  });
  final List<String> memberList;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchUser = ref.watch(searchUserNotifierProvider(memberList));

    return searchUser.when(
      data: (data) {
        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 10),
              ...List.generate(
                data.length,
                (index) => MemberPanel(
                  profile: data[index],
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
