import 'package:account_book_app/application/providers/create_target_provider/notifier/create_target_notifier.dart';
import 'package:account_book_app/application/providers/create_target_provider/state/create_target_state.dart';
import 'package:account_book_app/application/providers/sign_in_provider/state/sign_in_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../services/profile_service.dart';

final createTargetNotifierProvider =
    StateNotifierProvider<CreateTargetNotifier, CreateTargetState>(
  (ref) => CreateTargetNotifier(
    service: ref.read(profileServiceProvider),
  ),
);
