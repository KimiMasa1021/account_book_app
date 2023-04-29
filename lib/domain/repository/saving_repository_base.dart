import '../../application/providers/saving_provider/state/saving_state.dart';

abstract class SavingRepositoryBase {
  void subscribeStream(
    void Function(List<SavingState>) onCompleted,
    String productId,
  );
  void subscribeUserStream(void Function(List<SavingState> p1) onCompleted);
}
