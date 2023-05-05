import 'package:account_book_app/application/providers/target_provider/notifier/target_notifier.dart';
import 'package:account_book_app/application/providers/target_provider/state/target_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../services/target_service.dart';

final targetNotifierProvider =
    StateNotifierProvider<TargetNotifier, AsyncValue<List<TargetState>>>(
  (ref) => TargetNotifier(
    ref: ref,
    targetService: ref.read(targetServiceProvider),
  )..init(),
);
