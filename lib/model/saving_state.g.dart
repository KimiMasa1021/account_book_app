// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saving_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SavingState _$$_SavingStateFromJson(Map<String, dynamic> json) =>
    _$_SavingState(
      registeTime:
          const TimestampConverter().fromJson(json['registeTime'] as Timestamp),
      price: json['price'] as int? ?? 0,
      memo: json['memo'] as String? ?? "",
      member: json['member'] as String? ?? "",
    );

Map<String, dynamic> _$$_SavingStateToJson(_$_SavingState instance) =>
    <String, dynamic>{
      'registeTime': const TimestampConverter().toJson(instance.registeTime),
      'price': instance.price,
      'memo': instance.memo,
      'member': instance.member,
    };
