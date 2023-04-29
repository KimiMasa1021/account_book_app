import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../services/profile_service.dart';
import '../notifier/profile_state_notifier.dart';
import '../state/profile.dart';

final profileNotifierProvider = StateNotifierProvider<ProfileNotifier, Profile>(
  (ref) => ProfileNotifier(
    ref: ref,
    profileService: ref.read(profileServiceProvider),
  )..init(),
);
