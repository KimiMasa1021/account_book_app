import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../constant/hex_color.dart';
import '../../../../../provider/general_provider.dart';
import '../../../../component/setting/friend_tile_with_radio.dart';
import '../../../../theme/app_theme.dart';

class InviteMember extends HookConsumerWidget {
  const InviteMember({
    super.key,
    required this.docId,
  });
  final String docId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userState = ref.watch(usersControllerProvider);
    final friends = ref.watch(friendsControllerProvider(userState!.friends));
    final target = ref.watch(targetControllerProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#70D4F7"),
        title: const Text("招待"),
      ),
      body: target.when(
        data: (data) {
          final target = data.singleWhere((e) => e.docId == docId);
          final uninvitedMember = friends
              .where(
                (e) => !target.members.contains(e.uid),
              )
              .toList();
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ListView.builder(
                itemCount: uninvitedMember.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return FriendTileWithRadio(
                    usersState: uninvitedMember[index],
                  );
                },
              ),
            ),
          );
        },
        error: (error, stackTrace) {
          return const SizedBox();
        },
        loading: () {
          return const SizedBox();
        },
      ),
    );
  }
}
