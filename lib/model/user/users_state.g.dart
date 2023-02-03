// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UsersState _$$_UsersStateFromJson(Map<String, dynamic> json) =>
    _$_UsersState(
      email: json['email'] as String? ?? "",
      uid: json['uid'] as String? ?? "",
      name: json['name'] as String? ?? "",
      friends: (json['friends'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      friendsApproval: (json['friendsApproval'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      friendsRequest: (json['friendsRequest'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      img: json['img'] as String? ?? "",
    );

Map<String, dynamic> _$$_UsersStateToJson(_$_UsersState instance) =>
    <String, dynamic>{
      'email': instance.email,
      'uid': instance.uid,
      'name': instance.name,
      'friends': instance.friends,
      'friendsApproval': instance.friendsApproval,
      'friendsRequest': instance.friendsRequest,
      'img': instance.img,
    };
