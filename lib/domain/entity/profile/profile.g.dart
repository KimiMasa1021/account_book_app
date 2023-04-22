// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$$_ProfileFromJson(Map<String, dynamic> json) => _$_Profile(
      email: json['email'] as String? ?? "",
      uid: json['uid'] as String? ?? "",
      name: json['name'] as String? ?? "",
      friends: (json['friends'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      img: json['img'] as String? ?? "",
    );

Map<String, dynamic> _$$_ProfileToJson(_$_Profile instance) =>
    <String, dynamic>{
      'email': instance.email,
      'uid': instance.uid,
      'name': instance.name,
      'friends': instance.friends,
      'tags': instance.tags,
      'img': instance.img,
    };
