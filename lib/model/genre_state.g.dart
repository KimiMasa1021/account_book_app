// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genre_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_GenreState _$$_GenreStateFromJson(Map<String, dynamic> json) =>
    _$_GenreState(
      income: (json['income'] as List<dynamic>?)
              ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      expend: (json['expend'] as List<dynamic>?)
              ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$_GenreStateToJson(_$_GenreState instance) =>
    <String, dynamic>{
      'income': instance.income,
      'expend': instance.expend,
    };
