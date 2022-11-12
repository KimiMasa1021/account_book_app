import 'package:freezed_annotation/freezed_annotation.dart';

part 'genre.freezed.dart';
part 'genre.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class Genre with _$Genre {
  const Genre._();
  factory Genre({
    @Default("") String name,
    @Default(0) int seq,
  }) = _Genre;

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
}
