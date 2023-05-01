import 'package:account_book_app/application/providers/create_target_provider/state/create_target_state.dart';
import 'package:account_book_app/application/providers/profile_notifier_provider/state/profile.dart';
import 'package:account_book_app/application/services/profile_service.dart';
import 'package:account_book_app/domain/core/form/form_datetime_field.dart';
import 'package:account_book_app/domain/core/form/form_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CreateTargetNotifier extends StateNotifier<CreateTargetState> {
  CreateTargetNotifier({
    required this.service,
  }) : super(CreateTargetState.initial());

  final ProfileService service;

  void onStepContinue() {
    int x = state.stepperIndex;
    if (x >= 0 && x < 3) {
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

  void updateTarget(String val) {
    final flg = val.isNotEmpty ? true : false;
    state = state.copyWith(
      target: state.target.copyWith(
        value: val,
        isValid: flg,
      ),
    );
  }

  void updatePrice(String val) {
    late int price;
    if (val != "") {
      price = int.parse(val.replaceAll(",", ""));
    } else {
      price = 0;
    }
    state = state.copyWith(
      price: price,
    );
  }

  Future datePicker(BuildContext context) async {
    final now = DateTime.now();
    final dateTime = await DatePicker.showDatePicker(
      context,
      showTitleActions: true,
      minTime: now,
      maxTime: DateTime(2100, 12, 31),
      onChanged: (date) {},
      onConfirm: (date) {},
      currentTime: DateTime.now(),
      locale: LocaleType.jp,
    );

    state = state.copyWith(
      targetDate: state.targetDate.copyWith(
        value: dateTime,
        isValid: dateTime != null ? true : false,
      ),
    );
  }
}
