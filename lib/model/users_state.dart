import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_state.freezed.dart';
part 'users_state.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class UsersState with _$UsersState {
  const UsersState._();
  factory UsersState({
    @Default([]) List<String> genre,
    @Default([]) List<String> genre2,
    @Default("") String target,
    @Default(0) int targetPrice,
  }) = _UsersState;

  factory UsersState.fromJson(Map<String, dynamic> json) =>
      _$UsersStateFromJson(json);
}
