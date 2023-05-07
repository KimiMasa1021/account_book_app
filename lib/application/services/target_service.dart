import 'package:account_book_app/application/providers/target_provider/state/target_state.dart';
import 'package:account_book_app/infrastructure/repositorys/target_repository.dart';
import 'package:async/async.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final targetServiceProvider = Provider(
  (ref) => TargetService(
    targetRepository: ref.read(targetRepositoryProvider),
  ),
);

class TargetService {
  TargetService({required targetRepository})
      : _targetRepository = targetRepository,
        super();

  final TargetRepository _targetRepository;

  void subscribeTargetList(
    void Function(List<TargetState>) onCompleted,
  ) {
    _targetRepository.subscribeStream(
      onCompleted,
    );
  }

  Future<Result> addTarget(TargetState state) async {
    return await _targetRepository.addTarget(state);
  }

  Future<Result> editCurrentPercent(String productId, double newPercent) async {
    return await _targetRepository.editCurrentPercent(productId, newPercent);
  }
}
