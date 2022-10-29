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
  String get docId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  int get seq => throw _privateConstructorUsedError;

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
  $Res call({String docId, String name, int seq});
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
    Object? docId = null,
    Object? name = null,
    Object? seq = null,
  }) {
    return _then(_value.copyWith(
      docId: null == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      seq: null == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call({String docId, String name, int seq});
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
    Object? docId = null,
    Object? name = null,
    Object? seq = null,
  }) {
    return _then(_$_GenreState(
      docId: null == docId
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      seq: null == seq
          ? _value.seq
          : seq // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GenreState extends _GenreState {
  _$_GenreState({this.docId = "", this.name = "", this.seq = 0}) : super._();

  factory _$_GenreState.fromJson(Map<String, dynamic> json) =>
      _$$_GenreStateFromJson(json);

  @override
  @JsonKey()
  final String docId;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final int seq;

  @override
  String toString() {
    return 'GenreState(docId: $docId, name: $name, seq: $seq)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GenreState &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.seq, seq) || other.seq == seq));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, docId, name, seq);

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
  factory _GenreState({final String docId, final String name, final int seq}) =
      _$_GenreState;
  _GenreState._() : super._();

  factory _GenreState.fromJson(Map<String, dynamic> json) =
      _$_GenreState.fromJson;

  @override
  String get docId;
  @override
  String get name;
  @override
  int get seq;
  @override
  @JsonKey(ignore: true)
  _$$_GenreStateCopyWith<_$_GenreState> get copyWith =>
      throw _privateConstructorUsedError;
}