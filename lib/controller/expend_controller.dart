import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/genre_state.dart';
import '../repository/genre_repository.dart';

class ExpendController extends StateNotifier<List<GenreState>> {
  final Ref ref;
  ExpendController(this.ref) : super([]) {
    ref.read(GenreRepositoryProvider).fetchExpend().listen((data) {
      state = data.map((doc) {
        final value = GenreState(
          docId: doc.id,
          name: doc.data().name,
          seq: doc.data().seq,
        );
        return value;
      }).toList();
    });
  }

  Future<void> deleteExpend(String docId) async {
    await ref.read(GenreRepositoryProvider).deleteExpend(docId);
  }

  Future<void> updateSeq(GenreState newState, GenreState oldState) async {
    await ref.read(GenreRepositoryProvider).updateSeq(newState, oldState);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
