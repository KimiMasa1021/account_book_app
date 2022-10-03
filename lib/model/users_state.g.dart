// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UsersState _$$_UsersStateFromJson(Map<String, dynamic> json) =>
    _$_UsersState(
      genre: (json['genre'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {"": ""},
      genre2: (json['genre2'] as Map<String, dynamic>?)?.map(
            (k, e) => MapEntry(k, e as String),
          ) ??
          const {"": ""},
      target: json['target'] as String? ?? "",
      targetPrice: json['targetPrice'] as int? ?? 0,
    );

Map<String, dynamic> _$$_UsersStateToJson(_$_UsersState instance) =>
    <String, dynamic>{
      'genre': instance.genre,
      'genre2': instance.genre2,
      'target': instance.target,
      'targetPrice': instance.targetPrice,
    };
