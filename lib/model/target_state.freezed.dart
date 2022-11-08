// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

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
  String get groupName => throw _privateConstructorUsedError;
  List<String> get members => throw _privateConstructorUsedError;
  String get target => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  int get targetPrice => throw _privateConstructorUsedError;

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
      {String groupName,
      List<String> members,
      String target,
      String id,
      int targetPrice});
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
    Object? groupName = null,
    Object? members = null,
    Object? target = null,
    Object? id = null,
    Object? targetPrice = null,
  }) {
    return _then(_value.copyWith(
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      targetPrice: null == targetPrice
          ? _value.targetPrice
          : targetPrice // ignore: cast_nullable_to_non_nullable
              as int,
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
      {String groupName,
      List<String> members,
      String target,
      String id,
      int targetPrice});
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
    Object? groupName = null,
    Object? members = null,
    Object? target = null,
    Object? id = null,
    Object? targetPrice = null,
  }) {
    return _then(_$_TargetState(
      groupName: null == groupName
          ? _value.groupName
          : groupName // ignore: cast_nullable_to_non_nullable
              as String,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<String>,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
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
class _$_TargetState extends _TargetState {
  _$_TargetState(
      {this.groupName = "",
      final List<String> members = const [],
      this.target = "",
      this.id = "",
      this.targetPrice = 0})
      : _members = members,
        super._();

  factory _$_TargetState.fromJson(Map<String, dynamic> json) =>
      _$$_TargetStateFromJson(json);

  @override
  @JsonKey()
  final String groupName;
  final List<String> _members;
  @override
  @JsonKey()
  List<String> get members {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  @JsonKey()
  final String target;
  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final int targetPrice;

  @override
  String toString() {
    return 'TargetState(groupName: $groupName, members: $members, target: $target, id: $id, targetPrice: $targetPrice)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TargetState &&
            (identical(other.groupName, groupName) ||
                other.groupName == groupName) &&
            const DeepCollectionEquality().equals(other._members, _members) &&
            (identical(other.target, target) || other.target == target) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.targetPrice, targetPrice) ||
                other.targetPrice == targetPrice));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, groupName,
      const DeepCollectionEquality().hash(_members), target, id, targetPrice);

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
      {final String groupName,
      final List<String> members,
      final String target,
      final String id,
      final int targetPrice}) = _$_TargetState;
  _TargetState._() : super._();

  factory _TargetState.fromJson(Map<String, dynamic> json) =
      _$_TargetState.fromJson;

  @override
  String get groupName;
  @override
  List<String> get members;
  @override
  String get target;
  @override
  String get id;
  @override
  int get targetPrice;
  @override
  @JsonKey(ignore: true)
  _$$_TargetStateCopyWith<_$_TargetState> get copyWith =>
      throw _privateConstructorUsedError;
}
