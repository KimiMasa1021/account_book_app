// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'target_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TargetState _$$_TargetStateFromJson(Map<String, dynamic> json) =>
    _$_TargetState(
      productId: json['productId'] as String? ?? "",
      registeTime:
          const TimestampConverter().fromJson(json['registeTime'] as Timestamp),
      targetDate:
          const TimestampConverter().fromJson(json['targetDate'] as Timestamp),
      members: (json['members'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      target: json['target'] as String? ?? "",
      imageUrl: json['imageUrl'] as String? ?? "",
      targetPrice: json['targetPrice'] as int? ?? 0,
      currentPercent: (json['currentPercent'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$$_TargetStateToJson(_$_TargetState instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'registeTime': const TimestampConverter().toJson(instance.registeTime),
      'targetDate': const TimestampConverter().toJson(instance.targetDate),
      'members': instance.members,
      'target': instance.target,
      'imageUrl': instance.imageUrl,
      'targetPrice': instance.targetPrice,
      'currentPercent': instance.currentPercent,
    };
