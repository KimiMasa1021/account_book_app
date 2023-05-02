import 'dart:io';

import 'package:async/async.dart';

abstract class StoregeRepositoryBase {
  Future<Result<String>> uploadImage(File file);
}
