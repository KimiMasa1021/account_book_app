import 'package:account_book_app/application/providers/create_saving_provider/notifier/create_saving_notifier.dart';
import 'package:account_book_app/application/providers/create_saving_provider/state/create_saving_state.dart';
import 'package:account_book_app/application/services/storege_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../services/target_service.dart';

final createSavingNotifierProvider =
    StateNotifierProvider.autoDispose<CreateSavingNotifier, CreateSavingState>(
  (ref) => CreateSavingNotifier(
    targetService: ref.read(targetServiceProvider),
    storageService: ref.read(storageServiceProvider),
    ref: ref,
  ),
);
