import 'package:account_book_app/model/saving_state.dart';
import 'package:account_book_app/provider/general_provider.dart';
import 'package:account_book_app/repository/target_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class SavingController extends StateNotifier<List<SavingState>> {
  final Ref ref;
  SavingController(this.ref) : super([]) {
    ref.read(targetRepositoryProvider).feachSaving().listen((data) {
      state = data.map((doc) => doc.data()).toList();
    });
  }
  Future<void> addSaving(
      String productId, String memo, String price, Function() fucntion) async {
    final priceInt = int.parse(price.replaceAll(",", ""));
    final uid = ref.read(authControllerProvider)!.uid;
    final state = SavingState(
      createdAt: DateTime.now(),
      price: priceInt,
      productId: productId,
      userId: uid,
      memo: memo,
    );
    await ref.read(targetRepositoryProvider).addSaving(state);
    fucntion();
  }

  String formatYen(int targetPrice) {
    final numberFormat = NumberFormat(',###');
    return '${numberFormat.format(targetPrice)}円';
  }
}
