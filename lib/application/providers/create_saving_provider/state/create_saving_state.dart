import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_saving_state.freezed.dart';

@freezed
class CreateSavingState with _$CreateSavingState {
  const factory CreateSavingState({
    @Default(0) int price,
    @Default("") String tag,
    @Default(false) bool isLoading,
  }) = _CreateSavingState;
}
