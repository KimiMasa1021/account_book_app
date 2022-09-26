// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AccountState _$AccountStateFromJson(Map<String, dynamic> json) {
  return _AccountState.fromJson(json);
}

/// @nodoc
mixin _$AccountState {
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get registeTime => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AccountStateCopyWith<AccountState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res>;
  $Res call(
      {@TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime registeTime,
      String type,
      int price,
      String memo});
}

/// @nodoc
class _$AccountStateCopyWithImpl<$Res> implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  final AccountState _value;
  // ignore: unused_field
  final $Res Function(AccountState) _then;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? registeTime = freezed,
    Object? type = freezed,
    Object? price = freezed,
    Object? memo = freezed,
  }) {
    return _then(_value.copyWith(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      registeTime: registeTime == freezed
          ? _value.registeTime
          : registeTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$$_AccountStateCopyWith<$Res>
    implements $AccountStateCopyWith<$Res> {
  factory _$$_AccountStateCopyWith(
          _$_AccountState value, $Res Function(_$_AccountState) then) =
      __$$_AccountStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {@TimestampConverter() DateTime createdAt,
      @TimestampConverter() DateTime registeTime,
      String type,
      int price,
      String memo});
}

/// @nodoc
class __$$_AccountStateCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements _$$_AccountStateCopyWith<$Res> {
  __$$_AccountStateCopyWithImpl(
      _$_AccountState _value, $Res Function(_$_AccountState) _then)
      : super(_value, (v) => _then(v as _$_AccountState));

  @override
  _$_AccountState get _value => super._value as _$_AccountState;

  @override
  $Res call({
    Object? createdAt = freezed,
    Object? registeTime = freezed,
    Object? type = freezed,
    Object? price = freezed,
    Object? memo = freezed,
  }) {
    return _then(_$_AccountState(
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      registeTime: registeTime == freezed
          ? _value.registeTime
          : registeTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      price: price == freezed
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      memo: memo == freezed
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AccountState extends _AccountState {
  _$_AccountState(
      {@TimestampConverter() required this.createdAt,
      @TimestampConverter() required this.registeTime,
      this.type = "",
      this.price = 0,
      this.memo = ""})
      : super._();

  factory _$_AccountState.fromJson(Map<String, dynamic> json) =>
      _$$_AccountStateFromJson(json);

  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  @TimestampConverter()
  final DateTime registeTime;
  @override
  @JsonKey()
  final String type;
  @override
  @JsonKey()
  final int price;
  @override
  @JsonKey()
  final String memo;

  @override
  String toString() {
    return 'AccountState(createdAt: $createdAt, registeTime: $registeTime, type: $type, price: $price, memo: $memo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountState &&
            const DeepCollectionEquality().equals(other.createdAt, createdAt) &&
            const DeepCollectionEquality()
                .equals(other.registeTime, registeTime) &&
            const DeepCollectionEquality().equals(other.type, type) &&
            const DeepCollectionEquality().equals(other.price, price) &&
            const DeepCollectionEquality().equals(other.memo, memo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(createdAt),
      const DeepCollectionEquality().hash(registeTime),
      const DeepCollectionEquality().hash(type),
      const DeepCollectionEquality().hash(price),
      const DeepCollectionEquality().hash(memo));

  @JsonKey(ignore: true)
  @override
  _$$_AccountStateCopyWith<_$_AccountState> get copyWith =>
      __$$_AccountStateCopyWithImpl<_$_AccountState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AccountStateToJson(
      this,
    );
  }
}

abstract class _AccountState extends AccountState {
  factory _AccountState(
      {@TimestampConverter() required final DateTime createdAt,
      @TimestampConverter() required final DateTime registeTime,
      final String type,
      final int price,
      final String memo}) = _$_AccountState;
  _AccountState._() : super._();

  factory _AccountState.fromJson(Map<String, dynamic> json) =
      _$_AccountState.fromJson;

  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  @TimestampConverter()
  DateTime get registeTime;
  @override
  String get type;
  @override
  int get price;
  @override
  String get memo;
  @override
  @JsonKey(ignore: true)
  _$$_AccountStateCopyWith<_$_AccountState> get copyWith =>
      throw _privateConstructorUsedError;
}