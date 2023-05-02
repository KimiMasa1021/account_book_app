import 'package:async/async.dart';

import '../../application/providers/target_provider/state/target_state.dart';

abstract class TargetRepositoryBase {
  Future<Result<bool>> addTarget(TargetState state);
}
