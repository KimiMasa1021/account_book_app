import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
@freezed
class Profile with _$Profile {
  const Profile._();
  factory Profile({
    @Default("") String email,
    @Default("") String uid,
    @Default("") String name,
    @Default([]) List<String> friends,
    @Default([]) List<String> tags,
    @Default("") String img,
  }) = _Profile;

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
