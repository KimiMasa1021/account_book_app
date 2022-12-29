import 'package:account_book_app/model/saving_state.dart';
import 'package:account_book_app/provider/general_provider.dart';
import 'package:account_book_app/repository/target_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'dart:math';

class SavingController extends StateNotifier<List<SavingState>> {
  final Ref ref;
  SavingController(this.ref) : super([]) {
    ref.read(targetRepositoryProvider).feachSaving().listen((data) {
      state = data.map((doc) => doc.data()).toList();
    });
  }
  Future<void> addSaving(
      String productId, String memo, String price, Function() fucntion) async {
    final priceInt = int.parse(price.replaceAll(",", ""));
    final uid = ref.read(authControllerProvider)!.uid;
    final state = SavingState(
      createdAt: DateTime.now(),
      price: priceInt,
      productId: productId,
      userId: uid,
      memo: memo,
    );
    await ref.read(targetRepositoryProvider).addSaving(state);
    fucntion();
  }

  String formatYen(int targetPrice) {
    final numberFormat = NumberFormat(',###');
    return '${numberFormat.format(targetPrice)}円';
  }

  Future<List<int>> culcWeeklyList(
    List<SavingState> savingList,
    ValueNotifier<DateTime> date,
  ) async {
    final additionalDay = date.value.subtract(const Duration(days: 6));
    return List.generate(7, (index) {
      final test = savingList
          .where(
            (e) =>
                DateTime(
                  e.createdAt.year,
                  e.createdAt.month,
                  e.createdAt.day,
                ) ==
                DateTime(
                  additionalDay.year,
                  additionalDay.month,
                  additionalDay.day + index,
                ),
          )
          .map((e) => e.price)
          .toList();
      if (test.isEmpty) return 0;

      return test.reduce((a, b) => a + b);
    });
  }
}
