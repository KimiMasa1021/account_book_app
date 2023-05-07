import 'package:account_book_app/application/providers/saving_provider/state/saving_state.dart';
import 'package:account_book_app/application/services/saving_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SavingNotifier extends StateNotifier<AsyncValue<List<SavingState>>> {
  SavingNotifier({
    required this.ref,
    required this.productId,
    required SavingService savingService,
  })  : _savingService = savingService,
        super(const AsyncLoading());
  final Ref ref;
  final String productId;
  final SavingService _savingService;

  void init() {
    _savingService.subscribeSavingList(
      fetchSavingList,
      productId,
    );
  }

  void fetchSavingList(List<SavingState> savingList) {
    state = AsyncData(
      savingList,
    );
  }
}
