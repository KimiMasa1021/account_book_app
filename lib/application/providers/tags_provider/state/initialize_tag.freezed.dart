// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'initialize_tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$InitializeTag {
  List<String> get tags => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $InitializeTagCopyWith<InitializeTag> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InitializeTagCopyWith<$Res> {
  factory $InitializeTagCopyWith(
          InitializeTag value, $Res Function(InitializeTag) then) =
      _$InitializeTagCopyWithImpl<$Res, InitializeTag>;
  @useResult
  $Res call({List<String> tags, bool isLoading});
}

/// @nodoc
class _$InitializeTagCopyWithImpl<$Res, $Val extends InitializeTag>
    implements $InitializeTagCopyWith<$Res> {
  _$InitializeTagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tags = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitializeTagCopyWith<$Res>
    implements $InitializeTagCopyWith<$Res> {
  factory _$$_InitializeTagCopyWith(
          _$_InitializeTag value, $Res Function(_$_InitializeTag) then) =
      __$$_InitializeTagCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<String> tags, bool isLoading});
}

/// @nodoc
class __$$_InitializeTagCopyWithImpl<$Res>
    extends _$InitializeTagCopyWithImpl<$Res, _$_InitializeTag>
    implements _$$_InitializeTagCopyWith<$Res> {
  __$$_InitializeTagCopyWithImpl(
      _$_InitializeTag _value, $Res Function(_$_InitializeTag) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tags = null,
    Object? isLoading = null,
  }) {
    return _then(_$_InitializeTag(
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_InitializeTag implements _InitializeTag {
  const _$_InitializeTag(
      {final List<String> tags = const [], this.isLoading = false})
      : _tags = tags;

  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'InitializeTag(tags: $tags, isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InitializeTag &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_tags), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializeTagCopyWith<_$_InitializeTag> get copyWith =>
      __$$_InitializeTagCopyWithImpl<_$_InitializeTag>(this, _$identity);
}

abstract class _InitializeTag implements InitializeTag {
  const factory _InitializeTag(
      {final List<String> tags, final bool isLoading}) = _$_InitializeTag;

  @override
  List<String> get tags;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_InitializeTagCopyWith<_$_InitializeTag> get copyWith =>
      throw _privateConstructorUsedError;
}
