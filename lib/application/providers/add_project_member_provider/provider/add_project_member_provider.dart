import 'package:account_book_app/application/providers/add_project_member_provider/notifier/add_project_member_notifier.dart';
import 'package:account_book_app/application/providers/profile_notifier_provider/state/profile.dart';
import 'package:account_book_app/application/services/target_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final addProjectMemberProvider =
    StateNotifierProvider.autoDispose<AddProjectMemberNotifier, List<Profile>>(
  (ref) => AddProjectMemberNotifier(
    ref,
    targetService: ref.read(targetServiceProvider),
  ),
);
