// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'price_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PriceState {
  dynamic get expendState => throw _privateConstructorUsedError;
  dynamic get incomeState => throw _privateConstructorUsedError;
  dynamic get priceList => throw _privateConstructorUsedError;
  dynamic get expend => throw _privateConstructorUsedError;
  dynamic get income => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PriceStateCopyWith<PriceState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceStateCopyWith<$Res> {
  factory $PriceStateCopyWith(
          PriceState value, $Res Function(PriceState) then) =
      _$PriceStateCopyWithImpl<$Res>;
  $Res call(
      {dynamic expendState,
      dynamic incomeState,
      dynamic priceList,
      dynamic expend,
      dynamic income});
}

/// @nodoc
class _$PriceStateCopyWithImpl<$Res> implements $PriceStateCopyWith<$Res> {
  _$PriceStateCopyWithImpl(this._value, this._then);

  final PriceState _value;
  // ignore: unused_field
  final $Res Function(PriceState) _then;

  @override
  $Res call({
    Object? expendState = freezed,
    Object? incomeState = freezed,
    Object? priceList = freezed,
    Object? expend = freezed,
    Object? income = freezed,
  }) {
    return _then(_value.copyWith(
      expendState: expendState == freezed
          ? _value.expendState
          : expendState // ignore: cast_nullable_to_non_nullable
              as dynamic,
      incomeState: incomeState == freezed
          ? _value.incomeState
          : incomeState // ignore: cast_nullable_to_non_nullable
              as dynamic,
      priceList: priceList == freezed
          ? _value.priceList
          : priceList // ignore: cast_nullable_to_non_nullable
              as dynamic,
      expend: expend == freezed
          ? _value.expend
          : expend // ignore: cast_nullable_to_non_nullable
              as dynamic,
      income: income == freezed
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
abstract class _$$_PriceStateCopyWith<$Res>
    implements $PriceStateCopyWith<$Res> {
  factory _$$_PriceStateCopyWith(
          _$_PriceState value, $Res Function(_$_PriceState) then) =
      __$$_PriceStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {dynamic expendState,
      dynamic incomeState,
      dynamic priceList,
      dynamic expend,
      dynamic income});
}

/// @nodoc
class __$$_PriceStateCopyWithImpl<$Res> extends _$PriceStateCopyWithImpl<$Res>
    implements _$$_PriceStateCopyWith<$Res> {
  __$$_PriceStateCopyWithImpl(
      _$_PriceState _value, $Res Function(_$_PriceState) _then)
      : super(_value, (v) => _then(v as _$_PriceState));

  @override
  _$_PriceState get _value => super._value as _$_PriceState;

  @override
  $Res call({
    Object? expendState = freezed,
    Object? incomeState = freezed,
    Object? priceList = freezed,
    Object? expend = freezed,
    Object? income = freezed,
  }) {
    return _then(_$_PriceState(
      expendState: expendState == freezed ? _value.expendState : expendState,
      incomeState: incomeState == freezed ? _value.incomeState : incomeState,
      priceList: priceList == freezed ? _value.priceList : priceList,
      expend: expend == freezed ? _value.expend : expend,
      income: income == freezed ? _value.income : income,
    ));
  }
}

/// @nodoc

class _$_PriceState extends _PriceState {
  _$_PriceState(
      {this.expendState = const [],
      this.incomeState = const [],
      this.priceList = const [],
      this.expend = 0,
      this.income = 0})
      : super._();

  @override
  @JsonKey()
  final dynamic expendState;
  @override
  @JsonKey()
  final dynamic incomeState;
  @override
  @JsonKey()
  final dynamic priceList;
  @override
  @JsonKey()
  final dynamic expend;
  @override
  @JsonKey()
  final dynamic income;

  @override
  String toString() {
    return 'PriceState(expendState: $expendState, incomeState: $incomeState, priceList: $priceList, expend: $expend, income: $income)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceState &&
            const DeepCollectionEquality()
                .equals(other.expendState, expendState) &&
            const DeepCollectionEquality()
                .equals(other.incomeState, incomeState) &&
            const DeepCollectionEquality().equals(other.priceList, priceList) &&
            const DeepCollectionEquality().equals(other.expend, expend) &&
            const DeepCollectionEquality().equals(other.income, income));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(expendState),
      const DeepCollectionEquality().hash(incomeState),
      const DeepCollectionEquality().hash(priceList),
      const DeepCollectionEquality().hash(expend),
      const DeepCollectionEquality().hash(income));

  @JsonKey(ignore: true)
  @override
  _$$_PriceStateCopyWith<_$_PriceState> get copyWith =>
      __$$_PriceStateCopyWithImpl<_$_PriceState>(this, _$identity);
}

abstract class _PriceState extends PriceState {
  factory _PriceState(
      {final dynamic expendState,
      final dynamic incomeState,
      final dynamic priceList,
      final dynamic expend,
      final dynamic income}) = _$_PriceState;
  _PriceState._() : super._();

  @override
  dynamic get expendState;
  @override
  dynamic get incomeState;
  @override
  dynamic get priceList;
  @override
  dynamic get expend;
  @override
  dynamic get income;
  @override
  @JsonKey(ignore: true)
  _$$_PriceStateCopyWith<_$_PriceState> get copyWith =>
      throw _privateConstructorUsedError;
}
