import 'package:account_book_app/application/providers/saving_provider/state/saving_state.dart';
import 'package:account_book_app/infrastructure/repositorys/saving_repository.dart';
import 'package:async/async.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final savingServiceProvider = Provider((ref) =>
    SavingService(savingRepository: ref.read(savingRepositoryProvider)));

class SavingService {
  SavingService({
    required SavingRepository savingRepository,
  })  : _savingRepository = savingRepository,
        super();

  final SavingRepository _savingRepository;
  // 特定のプロジェクトのSavingList
  void subscribeSavingList(
    void Function(List<SavingState>) onCompleted,
    String productId,
  ) {
    _savingRepository.subscribeStream(
      onCompleted,
      productId,
    );
  }

  // 利用ユーザーのSavingList
  void subscribeUserSavingList(
    void Function(List<SavingState>) onCompleted,
  ) {
    _savingRepository.subscribeUserStream(onCompleted);
  }

  Future<Result> saveSaving(SavingState state, String id) async {
    return await _savingRepository.saveSaving(state, id);
  }
}
