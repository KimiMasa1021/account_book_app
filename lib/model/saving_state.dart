import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../constant/timestamp_converter.dart';
part 'saving_state.freezed.dart';
part 'saving_state.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class SavingState with _$SavingState {
  const SavingState._();
  factory SavingState({
    @TimestampConverter() required DateTime registeTime,
    @Default(0) int price,
    @Default("") String memo,
    @Default("") String member,
  }) = _SavingState;

  factory SavingState.fromJson(Map<String, dynamic> json) =>
      _$SavingStateFromJson(json);
}
