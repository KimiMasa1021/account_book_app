import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../infrastructure/repositorys/profile_repository.dart';

final tagsServiceProvider = Provider(
  (ref) => TagsService(
    profileRepository: ref.read(profileRepository),
  ),
);

class TagsService {
  TagsService({required profileRepository})
      : _profileRepository = profileRepository;

  final ProfileRepository _profileRepository;

  Future<void> initializeTag(List<String> tags) async {
    await _profileRepository.initializeTag(tags);
  }
}
