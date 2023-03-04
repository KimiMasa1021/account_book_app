import 'package:account_book_app/model/saving/saving_state.dart';
import 'package:account_book_app/view/pages/detail/widgets/saving_person_panel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../model/target/target_state.dart';
import '../../../../view_model/saving_controller.dart';
import '../../../../view_model/search_users_controller.dart';
import '../../../theme/app_text_theme.dart';
import 'dart:math';

class SavingPanel extends HookConsumerWidget {
  const SavingPanel({
    super.key,
    required this.state,
    required this.target,
  });
  final List<SavingState> state;
  final TargetState target;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final font = ref.watch(myTextTheme);
    final isOpen = useState(false);
    final savingCTL = ref.watch(savingControllerProvider.notifier);

    final targetMembers =
        ref.watch(searchUsersControllerProvider(target.members));

    return targetMembers.when(
      data: (data) {
        final price =
            state.map((e) => e.price).toList().reduce((e, v) => e + v);
        final byUserList = target.members.map((e) {
          return state.where((a) => a.userId == e).toList();
        }).toList();
        final nameList = byUserList
            .map(
              (e) {
                if (e.isEmpty) {
                  return null;
                } else {
                  return targetMembers.value!
                      .singleWhere((element) => element.uid == e[0].userId)
                      .name;
                }
              },
            )
            .toList()
            .toString();

        final displayName =
            nameList.substring(1, nameList.length - 1).replaceAll("null", "");
        return InkWell(
          onTap: () {
            isOpen.value = !isOpen.value;
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            state[0].createdAt.day.toString(),
                            style: font.fs19.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            savingCTL.formatWeek(state[0].createdAt.weekday),
                            style: font.fs19,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: Theme.of(context).textTheme.bodyText2,
                                children: [
                                  TextSpan(
                                    text: savingCTL.formatYen(price),
                                    style: font.fs27.copyWith(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '円',
                                    style: font.fs16.copyWith(),
                                  ),
                                ],
                              ),
                            ),
                            !isOpen.value
                                ? Text(
                                    displayName,
                                    overflow: TextOverflow.ellipsis,
                                  )
                                : const SizedBox(),
                          ],
                        ),
                      ),
                      Transform.rotate(
                        angle: isOpen.value ? 90 * pi / 180 : 0,
                        child: const Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                  isOpen.value
                      ? Column(
                          children: List.generate(
                            target.members.length,
                            (index) {
                              if (byUserList[index].isEmpty) {
                                return const SizedBox();
                              } else {
                                return SavingPersonPanel(
                                  name: targetMembers.value!
                                      .singleWhere((element) =>
                                          element.uid == target.members[index])
                                      .name,
                                  savingState: byUserList[index],
                                );
                              }
                            },
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
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
