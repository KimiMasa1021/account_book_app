import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_page_state.freezed.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class AddPageState with _$AddPageState {
  factory AddPageState({
    @Default([]) List<Map<String, String>> genre,
  }) = _AddPageState;
}
