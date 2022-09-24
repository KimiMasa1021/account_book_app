import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_page_state.freezed.dart';
part 'add_page_state.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class AddPageState with _$AddPageState {
  const AddPageState._();
  factory AddPageState({
    @Default({"": ""}) Map<String, String> genre,
  }) = _AddPageState;

  factory AddPageState.fromJson(Map<String, dynamic> json) =>
      _$AddPageStateFromJson(json);
}
