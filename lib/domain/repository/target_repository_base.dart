import 'package:async/async.dart';

import '../../application/providers/target_provider/state/target_state.dart';

abstract class TargetRepositoryBase {
  Future<Result<bool>> addTarget(TargetState state);
  void subscribeStream(void Function(List<TargetState> p1) onCompleted);
  Future<Result> editCurrentPercent(
    String productId,
    double newPercent,
  );
  Future<Result<bool>> editProjectMember(
    String productId,
    List<String> newMemberList,
  );
}
