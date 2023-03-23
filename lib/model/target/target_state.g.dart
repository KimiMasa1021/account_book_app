// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TargetState _$$_TargetStateFromJson(Map<String, dynamic> json) =>
    _$_TargetState(
      docId: json['docId'] as String? ?? "",
      registeTime:
          const TimestampConverter().fromJson(json['registeTime'] as Timestamp),
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      target: json['target'] as String? ?? "",
      targetDescription: json['targetDescription'] as String? ?? "",
      targetPrice: json['targetPrice'] as int? ?? 0,
      targetDate:
          const TimestampConverter().fromJson(json['targetDate'] as Timestamp),
      img: json['img'] as String? ?? "",
      isCompleted: json['isCompleted'] as bool? ?? false,
      currentPrice: json['currentPrice'] as int? ?? 0,
    );

Map<String, dynamic> _$$_TargetStateToJson(_$_TargetState instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'registeTime': const TimestampConverter().toJson(instance.registeTime),
      'members': instance.members,
      'target': instance.target,
      'targetDescription': instance.targetDescription,
      'targetPrice': instance.targetPrice,
      'targetDate': const TimestampConverter().toJson(instance.targetDate),
      'img': instance.img,
      'isCompleted': instance.isCompleted,
      'currentPrice': instance.currentPrice,
    };
