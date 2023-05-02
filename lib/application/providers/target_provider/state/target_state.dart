import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../common/timestamp_converter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'target_state.freezed.dart';
part 'target_state.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class TargetState with _$TargetState {
  const TargetState._();
  factory TargetState({
    @TimestampConverter() required DateTime registeTime,
    @TimestampConverter() required DateTime targetDate,
    @Default([]) List<String> members,
    @Default("") String target,
    @Default("") String imageUrl,
    @Default(0) int targetPrice,
    @Default(0) double currentPercent,
  }) = _TargetState;

  factory TargetState.fromJson(Map<String, dynamic> json) =>
      _$TargetStateFromJson(json);
}
