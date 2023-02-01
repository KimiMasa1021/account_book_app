import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../utility/timestamp_converter.dart';
part 'target_state.freezed.dart';
part 'target_state.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class TargetState with _$TargetState {
  const TargetState._();
  factory TargetState({
    @Default("") String docId,
    @TimestampConverter() required DateTime registeTime,
    @Default([]) List<String> members,
    @Default("") String target,
    @Default("") String targetDescription,
    @Default(0) int targetPrice,
    @TimestampConverter() required DateTime targetDate,
    @Default("") String img,
    @Default(0) int totalSaving,
    @Default(false) bool isCompleted,
  }) = _TargetState;

  factory TargetState.fromJson(Map<String, dynamic> json) =>
      _$TargetStateFromJson(json);
}
