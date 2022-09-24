// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountState _$$_AccountStateFromJson(Map<String, dynamic> json) =>
    _$_AccountState(
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      registeTime:
          const TimestampConverter().fromJson(json['registeTime'] as Timestamp),
      type: json['type'] as String? ?? "",
      price: json['price'] as int? ?? 0,
      memo: json['memo'] as String? ?? "",
    );

Map<String, dynamic> _$$_AccountStateToJson(_$_AccountState instance) =>
    <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'registeTime': const TimestampConverter().toJson(instance.registeTime),
      'type': instance.type,
      'price': instance.price,
      'memo': instance.memo,
    };
