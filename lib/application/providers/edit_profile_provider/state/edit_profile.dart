import 'dart:io';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_profile.freezed.dart';

@freezed
class EditProfile with _$EditProfile {
  const factory EditProfile({
    @Default(false) bool isLoading,
    @Default("") String newName,
    @Default(null) File? newImageFile,
  }) = _EditProfile;
}
