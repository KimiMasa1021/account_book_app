// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TargetState _$$_TargetStateFromJson(Map<String, dynamic> json) =>
    _$_TargetState(
      registeTime:
          const TimestampConverter().fromJson(json['registeTime'] as Timestamp),
      groupName: json['groupName'] as String? ?? "",
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      target: json['target'] as String? ?? "",
      id: json['id'] as String? ?? "",
      targetPrice: json['targetPrice'] as int? ?? 0,
    );

Map<String, dynamic> _$$_TargetStateToJson(_$_TargetState instance) =>
    <String, dynamic>{
      'registeTime': const TimestampConverter().toJson(instance.registeTime),
      'groupName': instance.groupName,
      'members': instance.members,
      'target': instance.target,
      'id': instance.id,
      'targetPrice': instance.targetPrice,
    };
