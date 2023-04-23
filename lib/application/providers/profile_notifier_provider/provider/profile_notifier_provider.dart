import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../services/profile_service.dart';
import '../notifier/profile_state_notifier.dart';

final profileNotifierProvider = StateNotifierProvider(
  (ref) => ProfileNotifier(
    profileService: ref.read(profileServiceProvider),
  )..init(),
);
