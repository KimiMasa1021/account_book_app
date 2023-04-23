import 'package:account_book_app/application/providers/tags_provider/notifier/tags_notifier.dart';
import 'package:account_book_app/application/providers/tags_provider/state/initialize_tag.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../services/tags_service.dart';

final tagsProvider = StateNotifierProvider<TagsNotifier, InitializeTag>(
  (ref) => TagsNotifier(
    tagsService: ref.read(tagsServiceProvider),
  ),
);
