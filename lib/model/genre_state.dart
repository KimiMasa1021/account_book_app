import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre_state.freezed.dart';
part 'genre_state.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class GenreState with _$GenreState {
  const GenreState._();
  factory GenreState({
    @Default("") String docId,
    @Default("") String name,
    @Default(0) int seq,
  }) = _GenreState;

  factory GenreState.fromJson(Map<String, dynamic> json) =>
      _$GenreStateFromJson(json);
}
