import 'package:account_book_app/application/providers/edit_profile_provider/notifier/edit_profile_notifier.dart';
import 'package:account_book_app/application/providers/edit_profile_provider/state/edit_profile.dart';
import 'package:account_book_app/application/providers/profile_notifier_provider/state/profile.dart';
import 'package:account_book_app/application/services/profile_service.dart';
import 'package:account_book_app/application/services/storege_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final editProfileProvider = StateNotifierProvider.autoDispose
    .family<EditProfileNotifier, EditProfile, Profile>(
  (ref, Profile profile) => EditProfileNotifier(
    ref,
    profile,
    profileService: ref.read(profileServiceProvider),
    storageService: ref.read(storageServiceProvider),
  ),
);
