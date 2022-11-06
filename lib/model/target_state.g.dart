// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TargetState _$$_TargetStateFromJson(Map<String, dynamic> json) =>
    _$_TargetState(
      groupName: json['groupName'] as String? ?? "",
      members: json['members'] as List<dynamic>? ?? const [],
      target: json['target'] as String? ?? "",
      id: json['id'] as String? ?? "",
      targetPrice: json['targetPrice'] as int? ?? 0,
    );

Map<String, dynamic> _$$_TargetStateToJson(_$_TargetState instance) =>
    <String, dynamic>{
      'groupName': instance.groupName,
      'members': instance.members,
      'target': instance.target,
      'id': instance.id,
      'targetPrice': instance.targetPrice,
    };
