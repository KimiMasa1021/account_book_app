import 'package:account_book_app/repository/saving_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SavingController extends StateNotifier {
  final Reader reader;
  SavingController(this.reader) : super(null);

  Future<void> initTarget(String target, int targetPrice) async {
    reader(savingRepositoryProvider).initTarget(target, targetPrice);
  }
}
