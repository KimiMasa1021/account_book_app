import 'package:account_book_app/application/providers/saving_provider/notifier/saving_notifier.dart';
import 'package:account_book_app/application/providers/saving_provider/state/saving_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../services/saving_service.dart';

final savingNotifierProvider = StateNotifierProvider.family<SavingNotifier,
    AsyncValue<List<SavingState>>, String>(
  (
    ref,
    String productId,
  ) =>
      SavingNotifier(
    ref: ref,
    productId: productId,
    savingService: ref.read(savingServiceProvider),
  )..init(),
);
