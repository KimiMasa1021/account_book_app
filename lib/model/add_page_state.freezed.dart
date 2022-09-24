// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'add_page_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

AddPageState _$AddPageStateFromJson(Map<String, dynamic> json) {
  return _AddPageState.fromJson(json);
}

/// @nodoc
mixin _$AddPageState {
  Map<String, String> get genre => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AddPageStateCopyWith<AddPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPageStateCopyWith<$Res> {
  factory $AddPageStateCopyWith(
          AddPageState value, $Res Function(AddPageState) then) =
      _$AddPageStateCopyWithImpl<$Res>;
  $Res call({Map<String, String> genre});
}

/// @nodoc
class _$AddPageStateCopyWithImpl<$Res> implements $AddPageStateCopyWith<$Res> {
  _$AddPageStateCopyWithImpl(this._value, this._then);

  final AddPageState _value;
  // ignore: unused_field
  final $Res Function(AddPageState) _then;

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
abstract class _$$_AddPageStateCopyWith<$Res>
    implements $AddPageStateCopyWith<$Res> {
  factory _$$_AddPageStateCopyWith(
          _$_AddPageState value, $Res Function(_$_AddPageState) then) =
      __$$_AddPageStateCopyWithImpl<$Res>;
  @override
  $Res call({Map<String, String> genre});
}

/// @nodoc
class __$$_AddPageStateCopyWithImpl<$Res>
    extends _$AddPageStateCopyWithImpl<$Res>
    implements _$$_AddPageStateCopyWith<$Res> {
  __$$_AddPageStateCopyWithImpl(
      _$_AddPageState _value, $Res Function(_$_AddPageState) _then)
      : super(_value, (v) => _then(v as _$_AddPageState));

  @override
  _$_AddPageState get _value => super._value as _$_AddPageState;

  @override
  $Res call({
    Object? genre = freezed,
  }) {
    return _then(_$_AddPageState(
      genre: genre == freezed
          ? _value._genre
          : genre // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_AddPageState extends _AddPageState {
  _$_AddPageState({final Map<String, String> genre = const {"": ""}})
      : _genre = genre,
        super._();

  factory _$_AddPageState.fromJson(Map<String, dynamic> json) =>
      _$$_AddPageStateFromJson(json);

  final Map<String, String> _genre;
  @override
  @JsonKey()
  Map<String, String> get genre {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_genre);
  }

  @override
  String toString() {
    return 'AddPageState(genre: $genre)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddPageState &&
            const DeepCollectionEquality().equals(other._genre, _genre));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_genre));

  @JsonKey(ignore: true)
  @override
  _$$_AddPageStateCopyWith<_$_AddPageState> get copyWith =>
      __$$_AddPageStateCopyWithImpl<_$_AddPageState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_AddPageStateToJson(
      this,
    );
  }
}

abstract class _AddPageState extends AddPageState {
  factory _AddPageState({final Map<String, String> genre}) = _$_AddPageState;
  _AddPageState._() : super._();

  factory _AddPageState.fromJson(Map<String, dynamic> json) =
      _$_AddPageState.fromJson;

  @override
  Map<String, String> get genre;
  @override
  @JsonKey(ignore: true)
  _$$_AddPageStateCopyWith<_$_AddPageState> get copyWith =>
      throw _privateConstructorUsedError;
}
