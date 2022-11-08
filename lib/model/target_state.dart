import 'package:freezed_annotation/freezed_annotation.dart';
part 'target_state.freezed.dart';
part 'target_state.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class TargetState with _$TargetState {
  const TargetState._();
  factory TargetState({
    @Default("") String groupName,
    @Default([]) List<String> members,
    @Default("") String target,
    @Default("") String id,
    @Default(0) int targetPrice,
  }) = _TargetState;

  factory TargetState.fromJson(Map<String, dynamic> json) =>
      _$TargetStateFromJson(json);
}
