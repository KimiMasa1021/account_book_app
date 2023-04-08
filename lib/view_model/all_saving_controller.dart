import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../model/saving/saving_state.dart';
import '../repository/target_repository.dart';

final allSavingControllerProvider =
    StateNotifierProvider<AllSavingController, AsyncValue<List<SavingState>>>(
        (ref) => AllSavingController(ref));

class AllSavingController extends StateNotifier<AsyncValue<List<SavingState>>> {
  final Ref ref;

  AllSavingController(this.ref) : super(const AsyncValue.loading()) {
    ref.read(targetRepositoryProvider).feachAllSaving().listen((data) {
      state = AsyncValue.data(data.map((doc) => doc.data()).toList());
    });
  }
}
