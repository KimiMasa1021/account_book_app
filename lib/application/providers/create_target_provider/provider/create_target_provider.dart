import 'package:account_book_app/application/providers/create_target_provider/notifier/create_target_notifier.dart';
import 'package:account_book_app/application/providers/create_target_provider/state/create_target_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../services/profile_service.dart';

final createTargetNotifierProvider =
    StateNotifierProvider.autoDispose<CreateTargetNotifier, CreateTargetState>(
  (ref) => CreateTargetNotifier(
    service: ref.read(profileServiceProvider),
  ),
);
