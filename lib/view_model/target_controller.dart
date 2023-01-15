import 'package:account_book_app/repository/target_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/target/target_state.dart';

class TargetController extends StateNotifier<AsyncValue<List<TargetState>>> {
  final Ref ref;
  TargetController(this.ref)
      : super(
          const AsyncValue.loading(),
        ) {
    ref.read(targetRepositoryProvider).feachTarget().listen(
      (data) {
        state = AsyncValue.data(
          data.map((doc) {
            final data = doc.data();
            return TargetState(
              registeTime: data.registeTime,
              targetDate: data.targetDate,
              members: data.members,
              target: data.target,
              targetDescription: data.targetDescription,
              img: data.img,
              targetPrice: data.targetPrice,
              docId: doc.id,
            );
          }).toList(),
        );
      },
    );
  }
}
