// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'users_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UsersState _$UsersStateFromJson(Map<String, dynamic> json) {
  return _UsersState.fromJson(json);
}

/// @nodoc
mixin _$UsersState {
  List<String> get genre => throw _privateConstructorUsedError;
  List<String> get genre2 => throw _privateConstructorUsedError;
  String get target => throw _privateConstructorUsedError;
  int get targetPrice => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UsersStateCopyWith<UsersState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsersStateCopyWith<$Res> {
  factory $UsersStateCopyWith(
          UsersState value, $Res Function(UsersState) then) =
      _$UsersStateCopyWithImpl<$Res, UsersState>;
  @useResult
  $Res call(
      {List<String> genre,
      List<String> genre2,
      String target,
      int targetPrice});
}

/// @nodoc
class _$UsersStateCopyWithImpl<$Res, $Val extends UsersState>
    implements $UsersStateCopyWith<$Res> {
  _$UsersStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genre = null,
    Object? genre2 = null,
    Object? target = null,
    Object? targetPrice = null,
  }) {
    return _then(_value.copyWith(
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as List<String>,
      genre2: null == genre2
          ? _value.genre2
          : genre2 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      targetPrice: null == targetPrice
          ? _value.targetPrice
          : targetPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UsersStateCopyWith<$Res>
    implements $UsersStateCopyWith<$Res> {
  factory _$$_UsersStateCopyWith(
          _$_UsersState value, $Res Function(_$_UsersState) then) =
      __$$_UsersStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<String> genre,
      List<String> genre2,
      String target,
      int targetPrice});
}

/// @nodoc
class __$$_UsersStateCopyWithImpl<$Res>
    extends _$UsersStateCopyWithImpl<$Res, _$_UsersState>
    implements _$$_UsersStateCopyWith<$Res> {
  __$$_UsersStateCopyWithImpl(
      _$_UsersState _value, $Res Function(_$_UsersState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? genre = null,
    Object? genre2 = null,
    Object? target = null,
    Object? targetPrice = null,
  }) {
    return _then(_$_UsersState(
      genre: null == genre
          ? _value._genre
          : genre // ignore: cast_nullable_to_non_nullable
              as List<String>,
      genre2: null == genre2
          ? _value._genre2
          : genre2 // ignore: cast_nullable_to_non_nullable
              as List<String>,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      targetPrice: null == targetPrice
          ? _value.targetPrice
          : targetPrice // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UsersState extends _UsersState {
  _$_UsersState(
      {final List<String> genre = const [],
      final List<String> genre2 = const [],
      this.target = "",
      this.targetPrice = 0})
      : _genre = genre,
        _genre2 = genre2,
        super._();

  factory _$_UsersState.fromJson(Map<String, dynamic> json) =>
      _$$_UsersStateFromJson(json);

  final List<String> _genre;
  @override
  @JsonKey()
  List<String> get genre {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genre);
  }

  final List<String> _genre2;
  @override
  @JsonKey()
  List<String> get genre2 {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genre2);
  }

  @override
  @JsonKey()
  final String target;
  @override
  @JsonKey()
  final int targetPrice;

  @override
  String toString() {
    return 'UsersState(genre: $genre, genre2: $genre2, target: $target, targetPrice: $targetPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UsersState &&
            const DeepCollectionEquality().equals(other._genre, _genre) &&
            const DeepCollectionEquality().equals(other._genre2, _genre2) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.targetPrice, targetPrice) ||
                other.targetPrice == targetPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_genre),
      const DeepCollectionEquality().hash(_genre2),
      target,
      targetPrice);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UsersStateCopyWith<_$_UsersState> get copyWith =>
      __$$_UsersStateCopyWithImpl<_$_UsersState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UsersStateToJson(
      this,
    );
  }
}

abstract class _UsersState extends UsersState {
  factory _UsersState(
      {final List<String> genre,
      final List<String> genre2,
      final String target,
      final int targetPrice}) = _$_UsersState;
  _UsersState._() : super._();

  factory _UsersState.fromJson(Map<String, dynamic> json) =
      _$_UsersState.fromJson;

  @override
  List<String> get genre;
  @override
  List<String> get genre2;
  @override
  String get target;
  @override
  int get targetPrice;
  @override
  @JsonKey(ignore: true)
  _$$_UsersStateCopyWith<_$_UsersState> get copyWith =>
      throw _privateConstructorUsedError;
}
