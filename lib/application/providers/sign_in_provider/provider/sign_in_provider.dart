import 'package:account_book_app/application/providers/sign_in_provider/state/sign_in_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../services/profile_service.dart';
import '../notifier/sign_in_notifier.dart';

final signInProvider = StateNotifierProvider<SignInNotifier, SignInState>(
  (ref) => SignInNotifier(
    ref,
    profileService: ref.read(profileServiceProvider),
  ),
);
