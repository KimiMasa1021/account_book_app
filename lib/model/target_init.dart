import 'dart:io';
import 'package:account_book_app/model/users_state.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'target_init.freezed.dart';

@freezed
class TargetInit with _$TargetInit {
  const TargetInit._();
  factory TargetInit({
    @Default([]) List<UsersState> selectedUserList,
    @Default(null) TextEditingController? targetController,
    @Default(null) TextEditingController? targetPriceController,
    @Default(null) TextEditingController? targetDescriptionController,
    @Default(null) DateTime? targetDateController,
    @Default(null) File? file,
  }) = _TargetInit;
}
