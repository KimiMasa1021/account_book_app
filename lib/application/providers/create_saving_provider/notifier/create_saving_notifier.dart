import 'package:account_book_app/application/services/storege_service.dart';
import 'package:account_book_app/application/services/target_service.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../common/price_formatter.dart';
import '../state/create_saving_state.dart';

class CreateSavingNotifier extends StateNotifier<CreateSavingState> {
  CreateSavingNotifier({
    required targetService,
    required this.ref,
    required storageService,
  })  : _targetService = targetService,
        _storageService = storageService,
        super(const CreateSavingState());

  final TargetService _targetService;
  final StorageService _storageService;
  final Ref ref;

  void changeTag(String val) {
    state = state.copyWith(tag: val);
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
  }
}
