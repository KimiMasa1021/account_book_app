import 'package:account_book_app/application/providers/target_provider/state/target_state.dart';
import 'package:account_book_app/application/services/target_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TargetNotifier extends StateNotifier<AsyncValue<List<TargetState>>> {
  TargetNotifier({
    required this.ref,
    required TargetService targetService,
  })  : _targetService = targetService,
        super(const AsyncLoading());
  final Ref ref;
  final TargetService _targetService;

  void init() {
    _targetService.subscribeTargetList(fetchTargetList);
  }

  void fetchTargetList(List<TargetState> targetList) {
    state = AsyncData(
      targetList,
    );
  }
}
