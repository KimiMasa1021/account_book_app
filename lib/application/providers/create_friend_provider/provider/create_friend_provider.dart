import 'package:account_book_app/application/providers/create_friend_provider/state/create_friend.dart';
import 'package:account_book_app/application/services/profile_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../notifier/create_friend_notifier.dart';

final createFriendProvider =
    StateNotifierProvider.autoDispose<CreateFriendNotifier, CreateFriend>(
  (ref) => CreateFriendNotifier(
    ref,
    profileService: ref.read(profileServiceProvider),
  ),
);
