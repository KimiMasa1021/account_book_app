// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'target_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TargetState _$TargetStateFromJson(Map<String, dynamic> json) {
  return _TargetState.fromJson(json);
}

/// @nodoc
mixin _$TargetState {
  @TimestampConverter()
  DateTime get registeTime => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get targetDate => throw _privateConstructorUsedError;
  List<String> get members => throw _privateConstructorUsedError;
  String get target => throw _privateConstructorUsedError;
  String get imageUrl => throw _privateConstructorUsedError;
  int get targetPrice => throw _privateConstructorUsedError;
  double get currentPercent => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TargetStateCopyWith<TargetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TargetStateCopyWith<$Res> {
  factory $TargetStateCopyWith(
          TargetState value, $Res Function(TargetState) then) =
      _$TargetStateCopyWithImpl<$Res, TargetState>;
  @useResult
  $Res call(
      {@TimestampConverter() DateTime registeTime,
      @TimestampConverter() DateTime targetDate,
      List<String> members,
      String target,
      String imageUrl,
      int targetPrice,
      double currentPercent});
}

/// @nodoc
class _$TargetStateCopyWithImpl<$Res, $Val extends TargetState>
    implements $TargetStateCopyWith<$Res> {
  _$TargetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registeTime = null,
    Object? targetDate = null,
    Object? members = null,
    Object? target = null,
    Object? imageUrl = null,
    Object? targetPrice = null,
    Object? currentPercent = null,
  }) {
    return _then(_value.copyWith(
      registeTime: null == registeTime
          ? _value.registeTime
          : registeTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      targetDate: null == targetDate
          ? _value.targetDate
          : targetDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      targetPrice: null == targetPrice
          ? _value.targetPrice
          : targetPrice // ignore: cast_nullable_to_non_nullable
              as int,
      currentPercent: null == currentPercent
          ? _value.currentPercent
          : currentPercent // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TargetStateCopyWith<$Res>
    implements $TargetStateCopyWith<$Res> {
  factory _$$_TargetStateCopyWith(
          _$_TargetState value, $Res Function(_$_TargetState) then) =
      __$$_TargetStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@TimestampConverter() DateTime registeTime,
      @TimestampConverter() DateTime targetDate,
      List<String> members,
      String target,
      String imageUrl,
      int targetPrice,
      double currentPercent});
}

/// @nodoc
class __$$_TargetStateCopyWithImpl<$Res>
    extends _$TargetStateCopyWithImpl<$Res, _$_TargetState>
    implements _$$_TargetStateCopyWith<$Res> {
  __$$_TargetStateCopyWithImpl(
      _$_TargetState _value, $Res Function(_$_TargetState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registeTime = null,
    Object? targetDate = null,
    Object? members = null,
    Object? target = null,
    Object? imageUrl = null,
    Object? targetPrice = null,
    Object? currentPercent = null,
  }) {
    return _then(_$_TargetState(
      registeTime: null == registeTime
          ? _value.registeTime
          : registeTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      targetDate: null == targetDate
          ? _value.targetDate
          : targetDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      imageUrl: null == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      targetPrice: null == targetPrice
          ? _value.targetPrice
          : targetPrice // ignore: cast_nullable_to_non_nullable
              as int,
      currentPercent: null == currentPercent
          ? _value.currentPercent
          : currentPercent // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TargetState extends _TargetState {
  _$_TargetState(
      {@TimestampConverter() required this.registeTime,
      @TimestampConverter() required this.targetDate,
      final List<String> members = const [],
      this.target = "",
      this.imageUrl = "",
      this.targetPrice = 0,
      this.currentPercent = 0})
      : _members = members,
        super._();

  factory _$_TargetState.fromJson(Map<String, dynamic> json) =>
      _$$_TargetStateFromJson(json);

  @override
  @TimestampConverter()
  final DateTime registeTime;
  @override
  @TimestampConverter()
  final DateTime targetDate;
  final List<String> _members;
  @override
  @JsonKey()
  List<String> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  @JsonKey()
  final String target;
  @override
  @JsonKey()
  final String imageUrl;
  @override
  @JsonKey()
  final int targetPrice;
  @override
  @JsonKey()
  final double currentPercent;

  @override
  String toString() {
    return 'TargetState(registeTime: $registeTime, targetDate: $targetDate, members: $members, target: $target, imageUrl: $imageUrl, targetPrice: $targetPrice, currentPercent: $currentPercent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TargetState &&
            (identical(other.registeTime, registeTime) ||
                other.registeTime == registeTime) &&
            (identical(other.targetDate, targetDate) ||
                other.targetDate == targetDate) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl) &&
            (identical(other.targetPrice, targetPrice) ||
                other.targetPrice == targetPrice) &&
            (identical(other.currentPercent, currentPercent) ||
                other.currentPercent == currentPercent));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      registeTime,
      targetDate,
      const DeepCollectionEquality().hash(_members),
      target,
      imageUrl,
      targetPrice,
      currentPercent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TargetStateCopyWith<_$_TargetState> get copyWith =>
      __$$_TargetStateCopyWithImpl<_$_TargetState>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TargetStateToJson(
      this,
    );
  }
}

abstract class _TargetState extends TargetState {
  factory _TargetState(
      {@TimestampConverter() required final DateTime registeTime,
      @TimestampConverter() required final DateTime targetDate,
      final List<String> members,
      final String target,
      final String imageUrl,
      final int targetPrice,
      final double currentPercent}) = _$_TargetState;
  _TargetState._() : super._();

  factory _TargetState.fromJson(Map<String, dynamic> json) =
      _$_TargetState.fromJson;

  @override
  @TimestampConverter()
  DateTime get registeTime;
  @override
  @TimestampConverter()
  DateTime get targetDate;
  @override
  List<String> get members;
  @override
  String get target;
  @override
  String get imageUrl;
  @override
  int get targetPrice;
  @override
  double get currentPercent;
  @override
  @JsonKey(ignore: true)
  _$$_TargetStateCopyWith<_$_TargetState> get copyWith =>
      throw _privateConstructorUsedError;
}
