// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'form_datetime_field.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FormDateTimeField {
  DateTime? get value => throw _privateConstructorUsedError;
  bool get isValid => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FormDateTimeFieldCopyWith<FormDateTimeField> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FormDateTimeFieldCopyWith<$Res> {
  factory $FormDateTimeFieldCopyWith(
          FormDateTimeField value, $Res Function(FormDateTimeField) then) =
      _$FormDateTimeFieldCopyWithImpl<$Res, FormDateTimeField>;
  @useResult
  $Res call({DateTime? value, bool isValid});
}

/// @nodoc
class _$FormDateTimeFieldCopyWithImpl<$Res, $Val extends FormDateTimeField>
    implements $FormDateTimeFieldCopyWith<$Res> {
  _$FormDateTimeFieldCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? isValid = null,
  }) {
    return _then(_value.copyWith(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FormDateTimeFieldCopyWith<$Res>
    implements $FormDateTimeFieldCopyWith<$Res> {
  factory _$$_FormDateTimeFieldCopyWith(_$_FormDateTimeField value,
          $Res Function(_$_FormDateTimeField) then) =
      __$$_FormDateTimeFieldCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? value, bool isValid});
}

/// @nodoc
class __$$_FormDateTimeFieldCopyWithImpl<$Res>
    extends _$FormDateTimeFieldCopyWithImpl<$Res, _$_FormDateTimeField>
    implements _$$_FormDateTimeFieldCopyWith<$Res> {
  __$$_FormDateTimeFieldCopyWithImpl(
      _$_FormDateTimeField _value, $Res Function(_$_FormDateTimeField) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
    Object? isValid = null,
  }) {
    return _then(_$_FormDateTimeField(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_FormDateTimeField implements _FormDateTimeField {
  const _$_FormDateTimeField({this.value, this.isValid = false});

  @override
  final DateTime? value;
  @override
  @JsonKey()
  final bool isValid;

  @override
  String toString() {
    return 'FormDateTimeField(value: $value, isValid: $isValid)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FormDateTimeField &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.isValid, isValid) || other.isValid == isValid));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value, isValid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FormDateTimeFieldCopyWith<_$_FormDateTimeField> get copyWith =>
      __$$_FormDateTimeFieldCopyWithImpl<_$_FormDateTimeField>(
          this, _$identity);
}

abstract class _FormDateTimeField implements FormDateTimeField {
  const factory _FormDateTimeField(
      {final DateTime? value, final bool isValid}) = _$_FormDateTimeField;

  @override
  DateTime? get value;
  @override
  bool get isValid;
  @override
  @JsonKey(ignore: true)
  _$$_FormDateTimeFieldCopyWith<_$_FormDateTimeField> get copyWith =>
      throw _privateConstructorUsedError;
}
