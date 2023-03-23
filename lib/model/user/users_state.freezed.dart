// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'users_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UsersState _$UsersStateFromJson(Map<String, dynamic> json) {
  return _UsersState.fromJson(json);
}

/// @nodoc
mixin _$UsersState {
  String get email => throw _privateConstructorUsedError;
  String get uid => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<String> get friends => throw _privateConstructorUsedError;
  List<String> get friendsApproval => throw _privateConstructorUsedError;
  List<String> get friendRequest => throw _privateConstructorUsedError;
  String get img => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersStateCopyWith<UsersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersStateCopyWith<$Res> {
  factory $UsersStateCopyWith(
          UsersState value, $Res Function(UsersState) then) =
      _$UsersStateCopyWithImpl<$Res, UsersState>;
  @useResult
  $Res call(
      {String email,
      String uid,
      String name,
      List<String> friends,
      List<String> friendsApproval,
      List<String> friendRequest,
      String img});
}

/// @nodoc
class _$UsersStateCopyWithImpl<$Res, $Val extends UsersState>
    implements $UsersStateCopyWith<$Res> {
  _$UsersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? uid = null,
    Object? name = null,
    Object? friends = null,
    Object? friendsApproval = null,
    Object? friendRequest = null,
    Object? img = null,
  }) {
    return _then(_value.copyWith(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      friends: null == friends
          ? _value.friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<String>,
      friendsApproval: null == friendsApproval
          ? _value.friendsApproval
          : friendsApproval // ignore: cast_nullable_to_non_nullable
              as List<String>,
      friendRequest: null == friendRequest
          ? _value.friendRequest
          : friendRequest // ignore: cast_nullable_to_non_nullable
              as List<String>,
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UsersStateCopyWith<$Res>
    implements $UsersStateCopyWith<$Res> {
  factory _$$_UsersStateCopyWith(
          _$_UsersState value, $Res Function(_$_UsersState) then) =
      __$$_UsersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String email,
      String uid,
      String name,
      List<String> friends,
      List<String> friendsApproval,
      List<String> friendRequest,
      String img});
}

/// @nodoc
class __$$_UsersStateCopyWithImpl<$Res>
    extends _$UsersStateCopyWithImpl<$Res, _$_UsersState>
    implements _$$_UsersStateCopyWith<$Res> {
  __$$_UsersStateCopyWithImpl(
      _$_UsersState _value, $Res Function(_$_UsersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = null,
    Object? uid = null,
    Object? name = null,
    Object? friends = null,
    Object? friendsApproval = null,
    Object? friendRequest = null,
    Object? img = null,
  }) {
    return _then(_$_UsersState(
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      friends: null == friends
          ? _value._friends
          : friends // ignore: cast_nullable_to_non_nullable
              as List<String>,
      friendsApproval: null == friendsApproval
          ? _value._friendsApproval
          : friendsApproval // ignore: cast_nullable_to_non_nullable
              as List<String>,
      friendRequest: null == friendRequest
          ? _value._friendRequest
          : friendRequest // ignore: cast_nullable_to_non_nullable
              as List<String>,
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UsersState extends _UsersState {
  _$_UsersState(
      {this.email = "",
      this.uid = "",
      this.name = "",
      final List<String> friends = const [],
      final List<String> friendsApproval = const [],
      final List<String> friendRequest = const [],
      this.img = ""})
      : _friends = friends,
        _friendsApproval = friendsApproval,
        _friendRequest = friendRequest,
        super._();

  factory _$_UsersState.fromJson(Map<String, dynamic> json) =>
      _$$_UsersStateFromJson(json);

  @override
  @JsonKey()
  final String email;
  @override
  @JsonKey()
  final String uid;
  @override
  @JsonKey()
  final String name;
  final List<String> _friends;
  @override
  @JsonKey()
  List<String> get friends {
    if (_friends is EqualUnmodifiableListView) return _friends;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friends);
  }

  final List<String> _friendsApproval;
  @override
  @JsonKey()
  List<String> get friendsApproval {
    if (_friendsApproval is EqualUnmodifiableListView) return _friendsApproval;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friendsApproval);
  }

  final List<String> _friendRequest;
  @override
  @JsonKey()
  List<String> get friendRequest {
    if (_friendRequest is EqualUnmodifiableListView) return _friendRequest;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friendRequest);
  }

  @override
  @JsonKey()
  final String img;

  @override
  String toString() {
    return 'UsersState(email: $email, uid: $uid, name: $name, friends: $friends, friendsApproval: $friendsApproval, friendRequest: $friendRequest, img: $img)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UsersState &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._friends, _friends) &&
            const DeepCollectionEquality()
                .equals(other._friendsApproval, _friendsApproval) &&
            const DeepCollectionEquality()
                .equals(other._friendRequest, _friendRequest) &&
            (identical(other.img, img) || other.img == img));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
      uid,
      name,
      const DeepCollectionEquality().hash(_friends),
      const DeepCollectionEquality().hash(_friendsApproval),
      const DeepCollectionEquality().hash(_friendRequest),
      img);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsersStateCopyWith<_$_UsersState> get copyWith =>
      __$$_UsersStateCopyWithImpl<_$_UsersState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UsersStateToJson(
      this,
    );
  }
}

abstract class _UsersState extends UsersState {
  factory _UsersState(
      {final String email,
      final String uid,
      final String name,
      final List<String> friends,
      final List<String> friendsApproval,
      final List<String> friendRequest,
      final String img}) = _$_UsersState;
  _UsersState._() : super._();

  factory _UsersState.fromJson(Map<String, dynamic> json) =
      _$_UsersState.fromJson;

  @override
  String get email;
  @override
  String get uid;
  @override
  String get name;
  @override
  List<String> get friends;
  @override
  List<String> get friendsApproval;
  @override
  List<String> get friendRequest;
  @override
  String get img;
  @override
  @JsonKey(ignore: true)
  _$$_UsersStateCopyWith<_$_UsersState> get copyWith =>
      throw _privateConstructorUsedError;
}
