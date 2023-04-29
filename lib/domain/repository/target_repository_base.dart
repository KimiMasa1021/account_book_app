import 'package:async/async.dart';

abstract class TargetRepositoryBase {
  Future<Result<bool>> addTarget();
}
