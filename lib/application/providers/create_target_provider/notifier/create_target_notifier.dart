import 'package:account_book_app/application/providers/create_target_provider/state/create_target_state.dart';
import 'package:account_book_app/application/providers/profile_notifier_provider/state/profile.dart';
import 'package:account_book_app/application/services/profile_service.dart';
import 'package:account_book_app/domain/core/form/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateTargetNotifier extends StateNotifier<CreateTargetState> {
  CreateTargetNotifier({
    required this.service,
  }) : super(CreateTargetState.initial());

  final ProfileService service;

  void onStepContinue() {
    int x = state.stepperIndex;
    if (x >= 0 && x < 2) {
      state = state.copyWith(stepperIndex: x += 1);
    }
  }

  void onStepCancel() {
    int x = state.stepperIndex;
    if (x > 0) {
      state = state.copyWith(stepperIndex: x -= 1);
    }
  }

  void setMember(Profile profile) {
    final flg = state.members.map((e) => e.uid).contains(profile.uid);

    if (flg) {
      List<Profile> newList = List.from(state.members);
      newList.remove(profile);
      state = state.copyWith(
        members: [...newList],
      );
    } else {
      state = state.copyWith(
        members: [...state.members, profile],
      );
    }
  }

  void updateTarget(val) {
    state = state.copyWith(
      target: FormTextField(value: val),
    );
    state = state.copyWith(
      target: FormTextField(
        isValid: state.target.value != "" ? true : false,
      ),
    );
  }

  void updatePrice(String val) {
    final price = int.parse(val.replaceAll(",", ""));
    state = state.copyWith(
      price: price,
    );
  }
}
