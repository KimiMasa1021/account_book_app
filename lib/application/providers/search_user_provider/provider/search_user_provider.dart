import 'package:account_book_app/application/providers/profile_notifier_provider/state/profile.dart';
import 'package:account_book_app/application/providers/search_user_provider/notifier/search_user_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../services/profile_service.dart';

final searchUserNotifierProvider = StateNotifierProvider.family<
    SearchUserNotifier, AsyncValue<List<Profile>>, List<String>>(
  (ref, List<String> membersList) => SearchUserNotifier(
    service: ref.read(profileServiceProvider),
    membersList: membersList,
  )..init(),
);
