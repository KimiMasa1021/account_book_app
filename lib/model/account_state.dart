import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../constant/timestamp_converter.dart';
part 'account_state.freezed.dart';
part 'account_state.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class AccountState with _$AccountState {
  const AccountState._();
  factory AccountState({
    @TimestampConverter() required DateTime createdAt,
    @TimestampConverter() required DateTime registeTime,
    @Default("") String type,
    @Default(0) int price,
    @Default("") String memo,
  }) = _AccountState;

  factory AccountState.fromJson(Map<String, dynamic> json) =>
      _$AccountStateFromJson(json);
}
