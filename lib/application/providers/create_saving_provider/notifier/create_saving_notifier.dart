import 'package:account_book_app/application/providers/profile_notifier_provider/provider/profile_notifier_provider.dart';
import 'package:account_book_app/application/providers/saving_provider/state/saving_state.dart';
import 'package:account_book_app/application/services/saving_service.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../common/price_formatter.dart';
import '../state/create_saving_state.dart';

class CreateSavingNotifier extends StateNotifier<CreateSavingState> {
  CreateSavingNotifier({
    required this.ref,
    required savingService,
  })  : _savingService = savingService,
        super(const CreateSavingState());

  final SavingService _savingService;
  final Ref ref;

  void changeTag(String val) {
    state = state.copyWith(tag: val);
  }

  void savePrice(TextEditingController priceController) {
    final price = priceController.value.text.replaceAll(",", "");
    state = state.copyWith(price: price.isNotEmpty ? int.parse(price) : 0);
  }

  void updatePrice(
    int value,
    TextEditingController priceController,
  ) {
    final preText = priceController.text;
    priceController.value = CustomTextInputFormatter().formatEditUpdate(
      TextEditingValue(text: preText),
      TextEditingValue(text: preText + value.toString()),
    );
    savePrice(priceController);
  }

  void backspeacePrice(
    TextEditingController priceController,
  ) {
    if (priceController.text.isEmpty) return;
    final preText = priceController.text;
    priceController.value = CustomTextInputFormatter().formatEditUpdate(
      TextEditingValue(text: preText),
      TextEditingValue(text: preText.substring(0, preText.length - 1)),
    );
    savePrice(priceController);
  }

  Future<void> enterPrice(String productId) async {
    state = state.copyWith(isLoading: true);
    final result = await saveSaving(productId);
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(isLoading: false);
  }

  Future<Result> saveSaving(String productId) async {
    final uid = ref.read(profileNotifierProvider).uid;
    final savingState = SavingState(
      productId: productId,
      tag: state.tag,
      price: state.price,
      userId: uid,
      createdAt: DateTime.now(),
    );
    return await _savingService.saveSaving(savingState, productId);
  }
}