import 'package:account_book_app/application/providers/profile_notifier_provider/state/profile.dart';
import 'package:account_book_app/application/services/profile_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchUserNotifier extends StateNotifier<AsyncValue<List<Profile>>> {
  SearchUserNotifier({
    required this.service,
    required this.membersList,
  }) : super(const AsyncLoading());

  final List<String> membersList;
  final ProfileService service;

  void init() {
    service.subscribeSearchUserProfile(
      fetchProfile,
      membersList,
    );
  }

  void fetchProfile(List<Profile> searchUser) {
    state = AsyncData(searchUser);
  }
}
