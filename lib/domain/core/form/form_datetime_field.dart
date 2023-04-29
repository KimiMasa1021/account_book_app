import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_datetime_field.freezed.dart';

@freezed
class FormDateTimeField with _$FormDateTimeField {
  const factory FormDateTimeField({
    DateTime? value,
    @Default(false) bool isValid,
  }) = _FormDateTimeField;
}
