// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'create_saving_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CreateSavingState {
  int get price => throw _privateConstructorUsedError;
  String get tag => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateSavingStateCopyWith<CreateSavingState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateSavingStateCopyWith<$Res> {
  factory $CreateSavingStateCopyWith(
          CreateSavingState value, $Res Function(CreateSavingState) then) =
      _$CreateSavingStateCopyWithImpl<$Res, CreateSavingState>;
  @useResult
  $Res call({int price, String tag, bool isLoading});
}

/// @nodoc
class _$CreateSavingStateCopyWithImpl<$Res, $Val extends CreateSavingState>
    implements $CreateSavingStateCopyWith<$Res> {
  _$CreateSavingStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? tag = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateSavingStateCopyWith<$Res>
    implements $CreateSavingStateCopyWith<$Res> {
  factory _$$_CreateSavingStateCopyWith(_$_CreateSavingState value,
          $Res Function(_$_CreateSavingState) then) =
      __$$_CreateSavingStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int price, String tag, bool isLoading});
}

/// @nodoc
class __$$_CreateSavingStateCopyWithImpl<$Res>
    extends _$CreateSavingStateCopyWithImpl<$Res, _$_CreateSavingState>
    implements _$$_CreateSavingStateCopyWith<$Res> {
  __$$_CreateSavingStateCopyWithImpl(
      _$_CreateSavingState _value, $Res Function(_$_CreateSavingState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? price = null,
    Object? tag = null,
    Object? isLoading = null,
  }) {
    return _then(_$_CreateSavingState(
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
      tag: null == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CreateSavingState implements _CreateSavingState {
  const _$_CreateSavingState(
      {this.price = 0, this.tag = "", this.isLoading = false});

  @override
  @JsonKey()
  final int price;
  @override
  @JsonKey()
  final String tag;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'CreateSavingState(price: $price, tag: $tag, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateSavingState &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, price, tag, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateSavingStateCopyWith<_$_CreateSavingState> get copyWith =>
      __$$_CreateSavingStateCopyWithImpl<_$_CreateSavingState>(
          this, _$identity);
}

abstract class _CreateSavingState implements CreateSavingState {
  const factory _CreateSavingState(
      {final int price,
      final String tag,
      final bool isLoading}) = _$_CreateSavingState;

  @override
  int get price;
  @override
  String get tag;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_CreateSavingStateCopyWith<_$_CreateSavingState> get copyWith =>
      throw _privateConstructorUsedError;
}
