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
  Map<String, String> get genre => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenreStateCopyWith<GenreState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenreStateCopyWith<$Res> {
  factory $GenreStateCopyWith(
          GenreState value, $Res Function(GenreState) then) =
      _$GenreStateCopyWithImpl<$Res>;
  $Res call({Map<String, String> genre});
}

/// @nodoc
class _$GenreStateCopyWithImpl<$Res> implements $GenreStateCopyWith<$Res> {
  _$GenreStateCopyWithImpl(this._value, this._then);

  final GenreState _value;
  // ignore: unused_field
  final $Res Function(GenreState) _then;

  @override
  $Res call({
    Object? genre = freezed,
  }) {
    return _then(_value.copyWith(
      genre: genre == freezed
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
abstract class _$$_GenreStateCopyWith<$Res>
    implements $GenreStateCopyWith<$Res> {
  factory _$$_GenreStateCopyWith(
          _$_GenreState value, $Res Function(_$_GenreState) then) =
      __$$_GenreStateCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, String> genre});
}

/// @nodoc
class __$$_GenreStateCopyWithImpl<$Res> extends _$GenreStateCopyWithImpl<$Res>
    implements _$$_GenreStateCopyWith<$Res> {
  __$$_GenreStateCopyWithImpl(
      _$_GenreState _value, $Res Function(_$_GenreState) _then)
      : super(_value, (v) => _then(v as _$_GenreState));

  @override
  _$_GenreState get _value => super._value as _$_GenreState;

  @override
  $Res call({
    Object? genre = freezed,
  }) {
    return _then(_$_GenreState(
      genre: genre == freezed
          ? _value._genre
          : genre // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenreState extends _GenreState {
  _$_GenreState({final Map<String, String> genre = const {"": ""}})
      : _genre = genre,
        super._();

  factory _$_GenreState.fromJson(Map<String, dynamic> json) =>
      _$$_GenreStateFromJson(json);

  final Map<String, String> _genre;
  @override
  @JsonKey()
  Map<String, String> get genre {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_genre);
  }

  @override
  String toString() {
    return 'GenreState(genre: $genre)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenreState &&
            const DeepCollectionEquality().equals(other._genre, _genre));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_genre));

  @JsonKey(ignore: true)
  @override
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
  factory _GenreState({final Map<String, String> genre}) = _$_GenreState;
  _GenreState._() : super._();

  factory _GenreState.fromJson(Map<String, dynamic> json) =
      _$_GenreState.fromJson;

  @override
  Map<String, String> get genre;
  @override
  @JsonKey(ignore: true)
  _$$_GenreStateCopyWith<_$_GenreState> get copyWith =>
      throw _privateConstructorUsedError;
}
