import 'package:freezed_annotation/freezed_annotation.dart';
part 'initialize_tag.freezed.dart';

@freezed
class InitializeTag with _$InitializeTag {
  const factory InitializeTag({
    @Default([]) List<String> tags,
    @Default(false) bool isLoading,
  }) = _InitializeTag;
}
