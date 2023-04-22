import 'package:account_book_app/application/profile_service.dart';
import 'package:account_book_app/domain/profile/models/profile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final profileNotifierProvider = StateNotifierProvider(
  (ref) => ProfileNotifier(
    profileService: ref.read(profileService),
  )..init(),
);

class ProfileNotifier extends StateNotifier<Profile> {
  ProfileNotifier({required ProfileService profileService})
      : _profileService = profileService,
        super(Profile());

  final ProfileService _profileService;

  void init() {
    _profileService.subscribeUserProfile(fetchProfile);
  }

  void fetchProfile(Profile profile) {
    state = profile;
  }
}
