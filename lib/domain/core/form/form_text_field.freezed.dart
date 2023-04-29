// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_text_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormTextField {
  String get value => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormTextFieldCopyWith<FormTextField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormTextFieldCopyWith<$Res> {
  factory $FormTextFieldCopyWith(
          FormTextField value, $Res Function(FormTextField) then) =
      _$FormTextFieldCopyWithImpl<$Res, FormTextField>;
  @useResult
  $Res call({String value, bool isValid});
}

/// @nodoc
class _$FormTextFieldCopyWithImpl<$Res, $Val extends FormTextField>
    implements $FormTextFieldCopyWith<$Res> {
  _$FormTextFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FormTextFieldCopyWith<$Res>
    implements $FormTextFieldCopyWith<$Res> {
  factory _$$_FormTextFieldCopyWith(
          _$_FormTextField value, $Res Function(_$_FormTextField) then) =
      __$$_FormTextFieldCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String value, bool isValid});
}

/// @nodoc
class __$$_FormTextFieldCopyWithImpl<$Res>
    extends _$FormTextFieldCopyWithImpl<$Res, _$_FormTextField>
    implements _$$_FormTextFieldCopyWith<$Res> {
  __$$_FormTextFieldCopyWithImpl(
      _$_FormTextField _value, $Res Function(_$_FormTextField) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? isValid = null,
  }) {
    return _then(_$_FormTextField(
      value: null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as String,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FormTextField implements _FormTextField {
  const _$_FormTextField({this.value = '', this.isValid = false});

  @override
  @JsonKey()
  final String value;
  @override
  @JsonKey()
  final bool isValid;

  @override
  String toString() {
    return 'FormTextField(value: $value, isValid: $isValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormTextField &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, isValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FormTextFieldCopyWith<_$_FormTextField> get copyWith =>
      __$$_FormTextFieldCopyWithImpl<_$_FormTextField>(this, _$identity);
}

abstract class _FormTextField implements FormTextField {
  const factory _FormTextField({final String value, final bool isValid}) =
      _$_FormTextField;

  @override
  String get value;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$_FormTextFieldCopyWith<_$_FormTextField> get copyWith =>
      throw _privateConstructorUsedError;
}
