import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/genre_state.dart';
import '../repository/genre_repository.dart';

class IncomeController extends StateNotifier<List<GenreState>> {
  final Ref ref;
  IncomeController(this.ref) : super([]) {
    ref.read(GenreRepositoryProvider).fetchIncome().listen((data) {
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
  Future<void> deleteIncome(String docId) async {
    await ref.read(GenreRepositoryProvider).deleteIncome(docId);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
