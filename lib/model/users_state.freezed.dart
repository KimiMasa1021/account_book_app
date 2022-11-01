// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  List<dynamic> get friends => throw _privateConstructorUsedError;
  String get target => throw _privateConstructorUsedError;
  String get img => throw _privateConstructorUsedError;
  int get targetPrice => throw _privateConstructorUsedError;

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
      List<dynamic> friends,
      String target,
      String img,
      int targetPrice});
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
    Object? target = null,
    Object? img = null,
    Object? targetPrice = null,
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
              as List<dynamic>,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
      targetPrice: null == targetPrice
          ? _value.targetPrice
          : targetPrice // ignore: cast_nullable_to_non_nullable
              as int,
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
      List<dynamic> friends,
      String target,
      String img,
      int targetPrice});
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
    Object? target = null,
    Object? img = null,
    Object? targetPrice = null,
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
              as List<dynamic>,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      img: null == img
          ? _value.img
          : img // ignore: cast_nullable_to_non_nullable
              as String,
      targetPrice: null == targetPrice
          ? _value.targetPrice
          : targetPrice // ignore: cast_nullable_to_non_nullable
              as int,
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
      final List<dynamic> friends = const [],
      this.target = "",
      this.img = "",
      this.targetPrice = 0})
      : _friends = friends,
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
  final List<dynamic> _friends;
  @override
  @JsonKey()
  List<dynamic> get friends {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_friends);
  }

  @override
  @JsonKey()
  final String target;
  @override
  @JsonKey()
  final String img;
  @override
  @JsonKey()
  final int targetPrice;

  @override
  String toString() {
    return 'UsersState(email: $email, uid: $uid, name: $name, friends: $friends, target: $target, img: $img, targetPrice: $targetPrice)';
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
            (identical(other.target, target) || other.target == target) &&
            (identical(other.img, img) || other.img == img) &&
            (identical(other.targetPrice, targetPrice) ||
                other.targetPrice == targetPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, email, uid, name,
      const DeepCollectionEquality().hash(_friends), target, img, targetPrice);

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
      final List<dynamic> friends,
      final String target,
      final String img,
      final int targetPrice}) = _$_UsersState;
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
  List<dynamic> get friends;
  @override
  String get target;
  @override
  String get img;
  @override
  int get targetPrice;
  @override
  @JsonKey(ignore: true)
  _$$_UsersStateCopyWith<_$_UsersState> get copyWith =>
      throw _privateConstructorUsedError;
}
