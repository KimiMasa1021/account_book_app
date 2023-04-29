import 'package:account_book_app/application/providers/saving_provider/state/saving_state.dart';
import 'package:account_book_app/application/services/saving_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserSavingNotifier extends StateNotifier<AsyncValue<List<SavingState>>> {
  UserSavingNotifier({
    required this.ref,
    required SavingService savingService,
  })  : _savingService = savingService,
        super(const AsyncLoading());
  final Ref ref;
  final SavingService _savingService;

  void init() {
    _savingService.subscribeUserSavingList(
      fetchSavingList,
    );
  }

  void fetchSavingList(List<SavingState> savingList) {
    state = AsyncData(
      savingList,
    );
    debugPrint(state.toString());
  }
}
