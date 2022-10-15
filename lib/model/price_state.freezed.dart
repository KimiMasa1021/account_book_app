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
  List<AccountState> get allState => throw _privateConstructorUsedError;
  List<AccountState> get monthlyState => throw _privateConstructorUsedError;
  List<AccountState> get expendState => throw _privateConstructorUsedError;
  List<AccountState> get incomeState => throw _privateConstructorUsedError;
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
      _$PriceStateCopyWithImpl<$Res, PriceState>;
  @useResult
  $Res call(
      {List<AccountState> allState,
      List<AccountState> monthlyState,
      List<AccountState> expendState,
      List<AccountState> incomeState,
      dynamic priceList,
      dynamic expend,
      dynamic income});
}

/// @nodoc
class _$PriceStateCopyWithImpl<$Res, $Val extends PriceState>
    implements $PriceStateCopyWith<$Res> {
  _$PriceStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allState = null,
    Object? monthlyState = null,
    Object? expendState = null,
    Object? incomeState = null,
    Object? priceList = null,
    Object? expend = null,
    Object? income = null,
  }) {
    return _then(_value.copyWith(
      allState: null == allState
          ? _value.allState
          : allState // ignore: cast_nullable_to_non_nullable
              as List<AccountState>,
      monthlyState: null == monthlyState
          ? _value.monthlyState
          : monthlyState // ignore: cast_nullable_to_non_nullable
              as List<AccountState>,
      expendState: null == expendState
          ? _value.expendState
          : expendState // ignore: cast_nullable_to_non_nullable
              as List<AccountState>,
      incomeState: null == incomeState
          ? _value.incomeState
          : incomeState // ignore: cast_nullable_to_non_nullable
              as List<AccountState>,
      priceList: null == priceList
          ? _value.priceList
          : priceList // ignore: cast_nullable_to_non_nullable
              as dynamic,
      expend: null == expend
          ? _value.expend
          : expend // ignore: cast_nullable_to_non_nullable
              as dynamic,
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PriceStateCopyWith<$Res>
    implements $PriceStateCopyWith<$Res> {
  factory _$$_PriceStateCopyWith(
          _$_PriceState value, $Res Function(_$_PriceState) then) =
      __$$_PriceStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AccountState> allState,
      List<AccountState> monthlyState,
      List<AccountState> expendState,
      List<AccountState> incomeState,
      dynamic priceList,
      dynamic expend,
      dynamic income});
}

/// @nodoc
class __$$_PriceStateCopyWithImpl<$Res>
    extends _$PriceStateCopyWithImpl<$Res, _$_PriceState>
    implements _$$_PriceStateCopyWith<$Res> {
  __$$_PriceStateCopyWithImpl(
      _$_PriceState _value, $Res Function(_$_PriceState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? allState = null,
    Object? monthlyState = null,
    Object? expendState = null,
    Object? incomeState = null,
    Object? priceList = null,
    Object? expend = null,
    Object? income = null,
  }) {
    return _then(_$_PriceState(
      allState: null == allState
          ? _value._allState
          : allState // ignore: cast_nullable_to_non_nullable
              as List<AccountState>,
      monthlyState: null == monthlyState
          ? _value._monthlyState
          : monthlyState // ignore: cast_nullable_to_non_nullable
              as List<AccountState>,
      expendState: null == expendState
          ? _value._expendState
          : expendState // ignore: cast_nullable_to_non_nullable
              as List<AccountState>,
      incomeState: null == incomeState
          ? _value._incomeState
          : incomeState // ignore: cast_nullable_to_non_nullable
              as List<AccountState>,
      priceList: null == priceList ? _value.priceList : priceList,
      expend: null == expend ? _value.expend : expend,
      income: null == income ? _value.income : income,
    ));
  }
}

/// @nodoc

class _$_PriceState extends _PriceState {
  _$_PriceState(
      {final List<AccountState> allState = const [],
      final List<AccountState> monthlyState = const [],
      final List<AccountState> expendState = const [],
      final List<AccountState> incomeState = const [],
      this.priceList = const [],
      this.expend = 0,
      this.income = 0})
      : _allState = allState,
        _monthlyState = monthlyState,
        _expendState = expendState,
        _incomeState = incomeState,
        super._();

  final List<AccountState> _allState;
  @override
  @JsonKey()
  List<AccountState> get allState {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allState);
  }

  final List<AccountState> _monthlyState;
  @override
  @JsonKey()
  List<AccountState> get monthlyState {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthlyState);
  }

  final List<AccountState> _expendState;
  @override
  @JsonKey()
  List<AccountState> get expendState {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expendState);
  }

  final List<AccountState> _incomeState;
  @override
  @JsonKey()
  List<AccountState> get incomeState {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_incomeState);
  }

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
    return 'PriceState(allState: $allState, monthlyState: $monthlyState, expendState: $expendState, incomeState: $incomeState, priceList: $priceList, expend: $expend, income: $income)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PriceState &&
            const DeepCollectionEquality().equals(other._allState, _allState) &&
            const DeepCollectionEquality()
                .equals(other._monthlyState, _monthlyState) &&
            const DeepCollectionEquality()
                .equals(other._expendState, _expendState) &&
            const DeepCollectionEquality()
                .equals(other._incomeState, _incomeState) &&
            const DeepCollectionEquality().equals(other.priceList, priceList) &&
            const DeepCollectionEquality().equals(other.expend, expend) &&
            const DeepCollectionEquality().equals(other.income, income));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_allState),
      const DeepCollectionEquality().hash(_monthlyState),
      const DeepCollectionEquality().hash(_expendState),
      const DeepCollectionEquality().hash(_incomeState),
      const DeepCollectionEquality().hash(priceList),
      const DeepCollectionEquality().hash(expend),
      const DeepCollectionEquality().hash(income));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PriceStateCopyWith<_$_PriceState> get copyWith =>
      __$$_PriceStateCopyWithImpl<_$_PriceState>(this, _$identity);
}

abstract class _PriceState extends PriceState {
  factory _PriceState(
      {final List<AccountState> allState,
      final List<AccountState> monthlyState,
      final List<AccountState> expendState,
      final List<AccountState> incomeState,
      final dynamic priceList,
      final dynamic expend,
      final dynamic income}) = _$_PriceState;
  _PriceState._() : super._();

  @override
  List<AccountState> get allState;
  @override
  List<AccountState> get monthlyState;
  @override
  List<AccountState> get expendState;
  @override
  List<AccountState> get incomeState;
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
