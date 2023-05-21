import 'package:account_book_app/application/providers/profile_notifier_provider/provider/profile_notifier_provider.dart';
import 'package:account_book_app/application/providers/target_provider/state/target_state.dart';
import 'package:account_book_app/application/services/target_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../presentation/widgets/common/lottie_dialog.dart';

class TargetNotifier extends StateNotifier<AsyncValue<List<TargetState>>> {
  TargetNotifier({
    required this.ref,
    required TargetService targetService,
  })  : _targetService = targetService,
        super(const AsyncLoading());
  final Ref ref;
  final TargetService _targetService;

  void init() {
    _targetService.subscribeTargetList(fetchTargetList);
  }

  void fetchTargetList(List<TargetState> targetList) {
    state = AsyncData(
      targetList,
    );
  }

  Future showExitProjectDialog(
    BuildContext context,
    TargetState targetState,
    Function() navToList,
  ) async {
    await showDialog(
      context: context,
      builder: (context) => LottieDialog(
        url: "assets/json/warning.json",
        title: "プロジェクトを抜ける",
        subTitle: "再度参加するにはほかのメンバーに招待してもらわなければなりません",
        button1Title: "脱退",
        onTap1: () async {
          await exitProject(targetState);
          navToList();
        },
        onTap2: () => context.pop(),
      ),
    );
  }

  Future<void> exitProject(TargetState targetState) async {
    final uid = ref.read(profileNotifierProvider).uid;
    final List<String> newMemberList = List.from(targetState.members);
    newMemberList.remove(uid);
    await _targetService.exitProject(targetState.productId, newMemberList);
  }
}
