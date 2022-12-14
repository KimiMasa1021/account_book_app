import 'package:freezed_annotation/freezed_annotation.dart';

part 'users_state.freezed.dart';
part 'users_state.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class UsersState with _$UsersState {
  const UsersState._();
  factory UsersState({
    @Default("") String email,
    @Default("") String uid,
    @Default("") String name,
    @Default([]) List<String> friends,
    @Default("") String img,
  }) = _UsersState;

  factory UsersState.fromJson(Map<String, dynamic> json) =>
      _$UsersStateFromJson(json);
}
