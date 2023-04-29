import 'package:freezed_annotation/freezed_annotation.dart';

part 'form_text_field.freezed.dart';

@freezed
class FormTextField with _$FormTextField {
  const factory FormTextField({
    @Default('') String value,
    @Default(false) bool isValid,
  }) = _FormTextField;
}
