// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'saving_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SavingState _$SavingStateFromJson(Map<String, dynamic> json) {
  return _SavingState.fromJson(json);
}

/// @nodoc
mixin _$SavingState {
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  String get productId => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SavingStateCopyWith<SavingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SavingStateCopyWith<$Res> {
  factory $SavingStateCopyWith(
          SavingState value, $Res Function(SavingState) then) =
      _$SavingStateCopyWithImpl<$Res, SavingState>;
  @useResult
  $Res call(
      {@TimestampConverter() DateTime createdAt,
      String productId,
      String userId,
      String memo,
      int price});
}

/// @nodoc
class _$SavingStateCopyWithImpl<$Res, $Val extends SavingState>
    implements $SavingStateCopyWith<$Res> {
  _$SavingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? productId = null,
    Object? userId = null,
    Object? memo = null,
    Object? price = null,
  }) {
    return _then(_value.copyWith(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SavingStateCopyWith<$Res>
    implements $SavingStateCopyWith<$Res> {
  factory _$$_SavingStateCopyWith(
          _$_SavingState value, $Res Function(_$_SavingState) then) =
      __$$_SavingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimestampConverter() DateTime createdAt,
      String productId,
      String userId,
      String memo,
      int price});
}

/// @nodoc
class __$$_SavingStateCopyWithImpl<$Res>
    extends _$SavingStateCopyWithImpl<$Res, _$_SavingState>
    implements _$$_SavingStateCopyWith<$Res> {
  __$$_SavingStateCopyWithImpl(
      _$_SavingState _value, $Res Function(_$_SavingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? createdAt = null,
    Object? productId = null,
    Object? userId = null,
    Object? memo = null,
    Object? price = null,
  }) {
    return _then(_$_SavingState(
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productId: null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SavingState extends _SavingState {
  _$_SavingState(
      {@TimestampConverter() required this.createdAt,
      this.productId = "",
      this.userId = "",
      this.memo = "",
      this.price = 0})
      : super._();

  factory _$_SavingState.fromJson(Map<String, dynamic> json) =>
      _$$_SavingStateFromJson(json);

  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @JsonKey()
  final String productId;
  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final String memo;
  @override
  @JsonKey()
  final int price;

  @override
  String toString() {
    return 'SavingState(createdAt: $createdAt, productId: $productId, userId: $userId, memo: $memo, price: $price)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SavingState &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.productId, productId) ||
                other.productId == productId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, createdAt, productId, userId, memo, price);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SavingStateCopyWith<_$_SavingState> get copyWith =>
      __$$_SavingStateCopyWithImpl<_$_SavingState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SavingStateToJson(
      this,
    );
  }
}

abstract class _SavingState extends SavingState {
  factory _SavingState(
      {@TimestampConverter() required final DateTime createdAt,
      final String productId,
      final String userId,
      final String memo,
      final int price}) = _$_SavingState;
  _SavingState._() : super._();

  factory _SavingState.fromJson(Map<String, dynamic> json) =
      _$_SavingState.fromJson;

  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  String get productId;
  @override
  String get userId;
  @override
  String get memo;
  @override
  int get price;
  @override
  @JsonKey(ignore: true)
  _$$_SavingStateCopyWith<_$_SavingState> get copyWith =>
      throw _privateConstructorUsedError;
}
