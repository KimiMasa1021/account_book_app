import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_tag.freezed.dart';

@freezed
class EditTag with _$EditTag {
  const factory EditTag({
    @Default(false) bool isLoading,
  }) = _EditTag;
}
