import 'package:account_book_app/repository/target_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/target/target_state.dart';
import '../repository/target_init_repository.dart';

final targetControllerProvider =
    StateNotifierProvider<TargetController, AsyncValue<List<TargetState>>>(
        (ref) => TargetController(ref));

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
              isCompleted: data.isCompleted,
              currentPrice: data.currentPrice,
            );
          }).toList(),
        );
      },
    );
  }
  // プロジェクトメンバーの追加
  Future<void> updateMember(
    List<String> preMembers,
    List<String> newMembers,
    String docId,
  ) async {
    final member = [...preMembers, ...newMembers];
    await ref.read(targetInitRepositoryProvider).updateMember(member, docId);
  }
}
