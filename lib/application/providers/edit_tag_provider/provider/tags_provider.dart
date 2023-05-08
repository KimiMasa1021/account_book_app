import 'package:account_book_app/application/providers/edit_tag_provider/notifier/tags_notifier.dart';
import 'package:account_book_app/application/providers/edit_tag_provider/state/edit_tag.dart';
import 'package:account_book_app/application/services/profile_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final editTagsProvider = StateNotifierProvider<EditTagNotifier, EditTag>(
  (ref) => EditTagNotifier(
    ref,
    profileService: ref.read(profileServiceProvider),
  ),
);
