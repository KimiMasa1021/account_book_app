// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UsersState _$$_UsersStateFromJson(Map<String, dynamic> json) =>
    _$_UsersState(
      genre:
          (json['genre'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      genre2: (json['genre2'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
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
