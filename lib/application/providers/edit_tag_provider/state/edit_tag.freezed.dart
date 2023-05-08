// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_tag.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditTag {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditTagCopyWith<EditTag> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditTagCopyWith<$Res> {
  factory $EditTagCopyWith(EditTag value, $Res Function(EditTag) then) =
      _$EditTagCopyWithImpl<$Res, EditTag>;
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class _$EditTagCopyWithImpl<$Res, $Val extends EditTag>
    implements $EditTagCopyWith<$Res> {
  _$EditTagCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditTagCopyWith<$Res> implements $EditTagCopyWith<$Res> {
  factory _$$_EditTagCopyWith(
          _$_EditTag value, $Res Function(_$_EditTag) then) =
      __$$_EditTagCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading});
}

/// @nodoc
class __$$_EditTagCopyWithImpl<$Res>
    extends _$EditTagCopyWithImpl<$Res, _$_EditTag>
    implements _$$_EditTagCopyWith<$Res> {
  __$$_EditTagCopyWithImpl(_$_EditTag _value, $Res Function(_$_EditTag) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
  }) {
    return _then(_$_EditTag(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_EditTag implements _EditTag {
  const _$_EditTag({this.isLoading = false});

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'EditTag(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditTag &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditTagCopyWith<_$_EditTag> get copyWith =>
      __$$_EditTagCopyWithImpl<_$_EditTag>(this, _$identity);
}

abstract class _EditTag implements EditTag {
  const factory _EditTag({final bool isLoading}) = _$_EditTag;

  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$_EditTagCopyWith<_$_EditTag> get copyWith =>
      throw _privateConstructorUsedError;
}
