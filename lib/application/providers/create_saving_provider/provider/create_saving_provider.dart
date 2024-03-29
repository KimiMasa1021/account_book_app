import 'package:account_book_app/application/providers/create_saving_provider/notifier/create_saving_notifier.dart';
import 'package:account_book_app/application/providers/create_saving_provider/state/create_saving_state.dart';
import 'package:account_book_app/application/services/saving_service.dart';
import 'package:account_book_app/application/services/target_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final createSavingNotifierProvider =
    StateNotifierProvider.autoDispose<CreateSavingNotifier, CreateSavingState>(
  (ref) => CreateSavingNotifier(
    savingService: ref.read(savingServiceProvider),
    targetService: ref.read(targetServiceProvider),
    ref: ref,
  ),
);
