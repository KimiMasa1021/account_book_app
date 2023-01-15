// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saving_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SavingState _$$_SavingStateFromJson(Map<String, dynamic> json) =>
    _$_SavingState(
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      productId: json['productId'] as String? ?? "",
      userId: json['userId'] as String? ?? "",
      memo: json['memo'] as String? ?? "",
      price: json['price'] as int? ?? 0,
    );

Map<String, dynamic> _$$_SavingStateToJson(_$_SavingState instance) =>
    <String, dynamic>{
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'productId': instance.productId,
      'userId': instance.userId,
      'memo': instance.memo,
      'price': instance.price,
    };
