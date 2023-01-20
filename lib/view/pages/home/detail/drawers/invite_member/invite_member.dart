import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../../../model/enums.dart';
import '../../../../../../view_model/friend_controller.dart';
import '../../../../../../view_model/target_controller.dart';
import '../../../../../../view_model/target_init_controller.dart';
import '../../../../../component/detail/member_tile.dart';
import '../../../../../component/lottie_loading.dart';

class InviteMember extends HookConsumerWidget {
  const InviteMember({
    super.key,
    required this.docId,
  });
  final String docId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final friends = ref.watch(friendsControllerProvider);
    final target = ref.watch(targetControllerProvider);
    final ValueNotifier<List<String>> newMembers = useState([]);
    final flg = useState(TargetInitFlg.inputing);
    final targetInitCTL =
        ref.watch(targetInitControllerProvider(null).notifier);

    return target.when(
      data: (data) {
        final target = data.singleWhere((e) => e.docId == docId);
        final uninvitedMember = friends
            .where(
              (e) => !target.members.contains(e.uid),
            )
            .toList();
        return Stack(
          children: [
            Scaffold(
              appBar: AppBar(
                title: const Text("招待"),
                actions: [
                  IconButton(
                    onPressed: () async {
                      if (newMembers.value.isNotEmpty) {
                        flg.value = TargetInitFlg.creating;
                        await targetInitCTL.updateMember(
                          target.members,
                          newMembers.value,
                          docId,
                        );
                        await Future.delayed(const Duration(seconds: 3));
                        flg.value = TargetInitFlg.complete;
                      }
                    },
                    padding: const EdgeInsets.only(right: 10),
                    icon: Text(
                      "追加",
                      // style: theme.textTheme.fs16.copyWith(
                      //   color: newMembers.value.isNotEmpty
                      //       ? Colors.white
                      //       : const Color.fromARGB(255, 205, 205, 205),
                      // ),
                    ),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: ListView.builder(
                    itemCount: uninvitedMember.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return MemberTIle(
                        usersState: uninvitedMember[index],
                        newMembers: newMembers,
                      );
                    },
                  ),
                ),
              ),
            ),
            LottieLoading(
              flg: flg.value,
              loadingPath: 'assets/json/invent_loading.json',
              loadingText: '招待中...',
              resultPath: 'assets/json/complete.json',
              resultText: 'メンバーに追加されました！',
              resultFunction: () {
                context.pop();
              },
            )
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
// invent_loading.json