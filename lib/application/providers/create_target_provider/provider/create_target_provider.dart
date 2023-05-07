import 'package:account_book_app/application/providers/create_target_provider/notifier/create_target_notifier.dart';
import 'package:account_book_app/application/providers/create_target_provider/state/create_target_state.dart';
import 'package:account_book_app/application/services/storege_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../services/target_service.dart';

final createTargetNotifierProvider =
    StateNotifierProvider.autoDispose<CreateTargetNotifier, CreateTargetState>(
  (ref) => CreateTargetNotifier(
    targetService: ref.read(targetServiceProvider),
    storageService: ref.read(storageServiceProvider),
    ref: ref,
  ),
);
