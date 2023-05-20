// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'saving_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SavingState _$$_SavingStateFromJson(Map<String, dynamic> json) =>
    _$_SavingState(
      docId: json['docId'] as String? ?? "",
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp),
      productId: json['productId'] as String? ?? "",
      userId: json['userId'] as String? ?? "",
      tag: json['tag'] as String? ?? "",
      price: json['price'] as int? ?? 0,
    );

Map<String, dynamic> _$$_SavingStateToJson(_$_SavingState instance) =>
    <String, dynamic>{
      'docId': instance.docId,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'productId': instance.productId,
      'userId': instance.userId,
      'tag': instance.tag,
      'price': instance.price,
    };
