import 'package:account_book_app/application/providers/saving_provider/state/saving_state.dart';
import 'package:account_book_app/application/providers/user_saving_provider/notifier/saving_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../services/saving_service.dart';

final userSavingNotifierProvider =
    StateNotifierProvider<UserSavingNotifier, AsyncValue<List<SavingState>>>(
  (ref) => UserSavingNotifier(
    ref: ref,
    savingService: ref.read(savingServiceProvider),
  )..init(),
);
