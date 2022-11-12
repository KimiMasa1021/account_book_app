// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'genre_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GenreState _$GenreStateFromJson(Map<String, dynamic> json) {
  return _GenreState.fromJson(json);
}

/// @nodoc
mixin _$GenreState {
  List<Genre> get income => throw _privateConstructorUsedError;
  List<Genre> get expend => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenreStateCopyWith<GenreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreStateCopyWith<$Res> {
  factory $GenreStateCopyWith(
          GenreState value, $Res Function(GenreState) then) =
      _$GenreStateCopyWithImpl<$Res, GenreState>;
  @useResult
  $Res call({List<Genre> income, List<Genre> expend});
}

/// @nodoc
class _$GenreStateCopyWithImpl<$Res, $Val extends GenreState>
    implements $GenreStateCopyWith<$Res> {
  _$GenreStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? income = null,
    Object? expend = null,
  }) {
    return _then(_value.copyWith(
      income: null == income
          ? _value.income
          : income // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
      expend: null == expend
          ? _value.expend
          : expend // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GenreStateCopyWith<$Res>
    implements $GenreStateCopyWith<$Res> {
  factory _$$_GenreStateCopyWith(
          _$_GenreState value, $Res Function(_$_GenreState) then) =
      __$$_GenreStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Genre> income, List<Genre> expend});
}

/// @nodoc
class __$$_GenreStateCopyWithImpl<$Res>
    extends _$GenreStateCopyWithImpl<$Res, _$_GenreState>
    implements _$$_GenreStateCopyWith<$Res> {
  __$$_GenreStateCopyWithImpl(
      _$_GenreState _value, $Res Function(_$_GenreState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? income = null,
    Object? expend = null,
  }) {
    return _then(_$_GenreState(
      income: null == income
          ? _value._income
          : income // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
      expend: null == expend
          ? _value._expend
          : expend // ignore: cast_nullable_to_non_nullable
              as List<Genre>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenreState extends _GenreState {
  _$_GenreState(
      {final List<Genre> income = const [],
      final List<Genre> expend = const []})
      : _income = income,
        _expend = expend,
        super._();

  factory _$_GenreState.fromJson(Map<String, dynamic> json) =>
      _$$_GenreStateFromJson(json);

  final List<Genre> _income;
  @override
  @JsonKey()
  List<Genre> get income {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_income);
  }

  final List<Genre> _expend;
  @override
  @JsonKey()
  List<Genre> get expend {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_expend);
  }

  @override
  String toString() {
    return 'GenreState(income: $income, expend: $expend)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenreState &&
            const DeepCollectionEquality().equals(other._income, _income) &&
            const DeepCollectionEquality().equals(other._expend, _expend));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_income),
      const DeepCollectionEquality().hash(_expend));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GenreStateCopyWith<_$_GenreState> get copyWith =>
      __$$_GenreStateCopyWithImpl<_$_GenreState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GenreStateToJson(
      this,
    );
  }
}

abstract class _GenreState extends GenreState {
  factory _GenreState({final List<Genre> income, final List<Genre> expend}) =
      _$_GenreState;
  _GenreState._() : super._();

  factory _GenreState.fromJson(Map<String, dynamic> json) =
      _$_GenreState.fromJson;

  @override
  List<Genre> get income;
  @override
  List<Genre> get expend;
  @override
  @JsonKey(ignore: true)
  _$$_GenreStateCopyWith<_$_GenreState> get copyWith =>
      throw _privateConstructorUsedError;
}
