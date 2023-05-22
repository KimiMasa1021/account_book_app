// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'edit_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EditProfile {
  bool get isLoading => throw _privateConstructorUsedError;
  String get newName => throw _privateConstructorUsedError;
  File? get newImageFile => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EditProfileCopyWith<EditProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EditProfileCopyWith<$Res> {
  factory $EditProfileCopyWith(
          EditProfile value, $Res Function(EditProfile) then) =
      _$EditProfileCopyWithImpl<$Res, EditProfile>;
  @useResult
  $Res call({bool isLoading, String newName, File? newImageFile});
}

/// @nodoc
class _$EditProfileCopyWithImpl<$Res, $Val extends EditProfile>
    implements $EditProfileCopyWith<$Res> {
  _$EditProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? newName = null,
    Object? newImageFile = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      newName: null == newName
          ? _value.newName
          : newName // ignore: cast_nullable_to_non_nullable
              as String,
      newImageFile: freezed == newImageFile
          ? _value.newImageFile
          : newImageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EditProfileCopyWith<$Res>
    implements $EditProfileCopyWith<$Res> {
  factory _$$_EditProfileCopyWith(
          _$_EditProfile value, $Res Function(_$_EditProfile) then) =
      __$$_EditProfileCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String newName, File? newImageFile});
}

/// @nodoc
class __$$_EditProfileCopyWithImpl<$Res>
    extends _$EditProfileCopyWithImpl<$Res, _$_EditProfile>
    implements _$$_EditProfileCopyWith<$Res> {
  __$$_EditProfileCopyWithImpl(
      _$_EditProfile _value, $Res Function(_$_EditProfile) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? newName = null,
    Object? newImageFile = freezed,
  }) {
    return _then(_$_EditProfile(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      newName: null == newName
          ? _value.newName
          : newName // ignore: cast_nullable_to_non_nullable
              as String,
      newImageFile: freezed == newImageFile
          ? _value.newImageFile
          : newImageFile // ignore: cast_nullable_to_non_nullable
              as File?,
    ));
  }
}

/// @nodoc

class _$_EditProfile implements _EditProfile {
  const _$_EditProfile(
      {this.isLoading = false, this.newName = "", this.newImageFile = null});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String newName;
  @override
  @JsonKey()
  final File? newImageFile;

  @override
  String toString() {
    return 'EditProfile(isLoading: $isLoading, newName: $newName, newImageFile: $newImageFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EditProfile &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.newName, newName) || other.newName == newName) &&
            (identical(other.newImageFile, newImageFile) ||
                other.newImageFile == newImageFile));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, newName, newImageFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EditProfileCopyWith<_$_EditProfile> get copyWith =>
      __$$_EditProfileCopyWithImpl<_$_EditProfile>(this, _$identity);
}

abstract class _EditProfile implements EditProfile {
  const factory _EditProfile(
      {final bool isLoading,
      final String newName,
      final File? newImageFile}) = _$_EditProfile;

  @override
  bool get isLoading;
  @override
  String get newName;
  @override
  File? get newImageFile;
  @override
  @JsonKey(ignore: true)
  _$$_EditProfileCopyWith<_$_EditProfile> get copyWith =>
      throw _privateConstructorUsedError;
}
