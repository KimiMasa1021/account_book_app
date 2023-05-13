// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_friend.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateFriend {
  bool get pageType => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  QRViewController? get controller => throw _privateConstructorUsedError;
  Profile? get user => throw _privateConstructorUsedError;
  String get qrData => throw _privateConstructorUsedError;
  String get qrPrevious => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateFriendCopyWith<CreateFriend> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateFriendCopyWith<$Res> {
  factory $CreateFriendCopyWith(
          CreateFriend value, $Res Function(CreateFriend) then) =
      _$CreateFriendCopyWithImpl<$Res, CreateFriend>;
  @useResult
  $Res call(
      {bool pageType,
      bool isLoading,
      QRViewController? controller,
      Profile? user,
      String qrData,
      String qrPrevious});

  $ProfileCopyWith<$Res>? get user;
}

/// @nodoc
class _$CreateFriendCopyWithImpl<$Res, $Val extends CreateFriend>
    implements $CreateFriendCopyWith<$Res> {
  _$CreateFriendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageType = null,
    Object? isLoading = null,
    Object? controller = freezed,
    Object? user = freezed,
    Object? qrData = null,
    Object? qrPrevious = null,
  }) {
    return _then(_value.copyWith(
      pageType: null == pageType
          ? _value.pageType
          : pageType // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as QRViewController?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Profile?,
      qrData: null == qrData
          ? _value.qrData
          : qrData // ignore: cast_nullable_to_non_nullable
              as String,
      qrPrevious: null == qrPrevious
          ? _value.qrPrevious
          : qrPrevious // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CreateFriendCopyWith<$Res>
    implements $CreateFriendCopyWith<$Res> {
  factory _$$_CreateFriendCopyWith(
          _$_CreateFriend value, $Res Function(_$_CreateFriend) then) =
      __$$_CreateFriendCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool pageType,
      bool isLoading,
      QRViewController? controller,
      Profile? user,
      String qrData,
      String qrPrevious});

  @override
  $ProfileCopyWith<$Res>? get user;
}

/// @nodoc
class __$$_CreateFriendCopyWithImpl<$Res>
    extends _$CreateFriendCopyWithImpl<$Res, _$_CreateFriend>
    implements _$$_CreateFriendCopyWith<$Res> {
  __$$_CreateFriendCopyWithImpl(
      _$_CreateFriend _value, $Res Function(_$_CreateFriend) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pageType = null,
    Object? isLoading = null,
    Object? controller = freezed,
    Object? user = freezed,
    Object? qrData = null,
    Object? qrPrevious = null,
  }) {
    return _then(_$_CreateFriend(
      pageType: null == pageType
          ? _value.pageType
          : pageType // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      controller: freezed == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as QRViewController?,
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as Profile?,
      qrData: null == qrData
          ? _value.qrData
          : qrData // ignore: cast_nullable_to_non_nullable
              as String,
      qrPrevious: null == qrPrevious
          ? _value.qrPrevious
          : qrPrevious // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CreateFriend implements _CreateFriend {
  const _$_CreateFriend(
      {this.pageType = false,
      this.isLoading = false,
      this.controller,
      this.user = null,
      this.qrData = "",
      this.qrPrevious = ""});

  @override
  @JsonKey()
  final bool pageType;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  final QRViewController? controller;
  @override
  @JsonKey()
  final Profile? user;
  @override
  @JsonKey()
  final String qrData;
  @override
  @JsonKey()
  final String qrPrevious;

  @override
  String toString() {
    return 'CreateFriend(pageType: $pageType, isLoading: $isLoading, controller: $controller, user: $user, qrData: $qrData, qrPrevious: $qrPrevious)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateFriend &&
            (identical(other.pageType, pageType) ||
                other.pageType == pageType) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.controller, controller) ||
                other.controller == controller) &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.qrData, qrData) || other.qrData == qrData) &&
            (identical(other.qrPrevious, qrPrevious) ||
                other.qrPrevious == qrPrevious));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, pageType, isLoading, controller, user, qrData, qrPrevious);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateFriendCopyWith<_$_CreateFriend> get copyWith =>
      __$$_CreateFriendCopyWithImpl<_$_CreateFriend>(this, _$identity);
}

abstract class _CreateFriend implements CreateFriend {
  const factory _CreateFriend(
      {final bool pageType,
      final bool isLoading,
      final QRViewController? controller,
      final Profile? user,
      final String qrData,
      final String qrPrevious}) = _$_CreateFriend;

  @override
  bool get pageType;
  @override
  bool get isLoading;
  @override
  QRViewController? get controller;
  @override
  Profile? get user;
  @override
  String get qrData;
  @override
  String get qrPrevious;
  @override
  @JsonKey(ignore: true)
  _$$_CreateFriendCopyWith<_$_CreateFriend> get copyWith =>
      throw _privateConstructorUsedError;
}
