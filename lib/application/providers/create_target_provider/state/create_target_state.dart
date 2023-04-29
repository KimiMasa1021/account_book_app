import 'dart:io';
import 'package:account_book_app/application/providers/profile_notifier_provider/state/profile.dart';
import 'package:account_book_app/domain/core/form/form_datetime_field.dart';
import 'package:account_book_app/domain/core/form/form_text_field.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_target_state.freezed.dart';

@freezed
class CreateTargetState with _$CreateTargetState {
  const factory CreateTargetState({
    required FormTextField target,
    required FormTextField description,
    @Default(0) int price,
    @Default([]) List<Profile> members,
    required FormDateTimeField targetDate,
    @Default(null) File? file,
    @Default(0) int stepperIndex,
    @Default(false) bool isLoading,
  }) = _CreateTargetState;

  factory CreateTargetState.initial() => const CreateTargetState(
        target: FormTextField(value: ""),
        description: FormTextField(value: ""),
        targetDate: FormDateTimeField(),
      );
}
