import 'package:account_book_app/application/providers/profile_notifier_provider/provider/profile_notifier_provider.dart';
import 'package:account_book_app/application/providers/saving_provider/state/saving_state.dart';
import 'package:account_book_app/application/providers/target_provider/state/target_state.dart';
import 'package:account_book_app/application/services/saving_service.dart';
import 'package:account_book_app/application/services/target_service.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../common/price_formatter.dart';
import '../state/create_saving_state.dart';

class CreateSavingNotifier extends StateNotifier<CreateSavingState> {
  CreateSavingNotifier({
    required this.ref,
    required savingService,
    required targetService,
    this.savingState,
  })  : _savingService = savingService,
        _targetService = targetService,
        super(CreateSavingState(
          price: savingState == null ? 0 : savingState.price,
          tag: savingState == null ? "" : savingState.tag,
        ));

  final SavingService _savingService;
  final TargetService _targetService;
  final Ref ref;
  final SavingState? savingState;

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

  Future<void> enterPrice(TargetState targetState, Function() backFuc) async {
    if (state.tag == "" || state.price == 0) return;
    state = state.copyWith(isLoading: true);
    final result = await saveSaving(targetState.productId);
    if (!result.isError) {
      await editCurrentPercent(targetState);
    }
    await Future.delayed(const Duration(seconds: 1));
    state = state.copyWith(isLoading: false);
    backFuc();
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

  Future<Result> editCurrentPercent(TargetState targetState) async {
    final price = state.price;
    final nowSum = targetState.targetPrice * targetState.currentPercent;
    final newSum = price + nowSum;
    final newPercent = newSum / targetState.targetPrice;
    return await _targetService.editCurrentPercent(
      targetState.productId,
      newPercent,
    );
  }

  void backScreenFuc(BuildContext context) {
    context.pop();
  }

  Future showEditSavingDialog(
    BuildContext context,
    SavingState savingState,
    TargetState targetState,
  ) async {
    final profile = ref.read(profileNotifierProvider);
    if (profile.uid != savingState.userId) {
      return;
    }
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: const Icon(Icons.delete_forever_outlined),
              title: const Text("削除する"),
              onTap: () async {
                context.pop();
                state = state.copyWith(isLoading: true);
                await deleteSaving(targetState, savingState);
                state = state.copyWith(isLoading: false);
              },
            ),
            ListTile(
              leading: const Icon(Icons.cancel_outlined),
              title: const Text("キャンセル"),
              onTap: () {
                context.pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future deleteSaving(TargetState targetState, SavingState savingState) async {
    final price = targetState.targetPrice * targetState.currentPercent;
    final newPercent = (price - savingState.price) / targetState.targetPrice;
    await _savingService.deleteSaving(savingState);
    await _targetService.editCurrentPercent(targetState.productId, newPercent);
    await Future.delayed(const Duration(seconds: 1));
  }
}
