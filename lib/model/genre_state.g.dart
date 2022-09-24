// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenreState _$$_GenreStateFromJson(Map<String, dynamic> json) =>
    _$_GenreState(
      genre: (json['genre'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {"": ""},
    );

Map<String, dynamic> _$$_GenreStateToJson(_$_GenreState instance) =>
    <String, dynamic>{
      'genre': instance.genre,
    };
