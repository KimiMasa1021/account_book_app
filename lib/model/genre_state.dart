import 'package:account_book_app/model/genre.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre_state.freezed.dart';
part 'genre_state.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class GenreState with _$GenreState {
  const GenreState._();
  factory GenreState({
    @Default([]) List<Genre> income,
    @Default([]) List<Genre> expend,
  }) = _GenreState;

  factory GenreState.fromJson(Map<String, dynamic> json) =>
      _$GenreStateFromJson(json);
}
