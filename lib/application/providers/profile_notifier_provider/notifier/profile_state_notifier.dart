import 'package:account_book_app/application/services/profile_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../domain/entity/profile/profile.dart';

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
