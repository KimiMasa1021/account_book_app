import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../common/timestamp_converter.dart';
part 'saving_state.freezed.dart';
part 'saving_state.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class SavingState with _$SavingState {
  const SavingState._();
  factory SavingState({
    @TimestampConverter() required DateTime createdAt,
    @Default("") String productId,
    @Default("") String userId,
    @Default("") String tag,
    @Default(0) int price,
  }) = _SavingState;

  factory SavingState.fromJson(Map<String, dynamic> json) =>
      _$SavingStateFromJson(json);
}
