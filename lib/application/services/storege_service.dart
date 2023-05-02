import 'dart:io';
import 'package:account_book_app/infrastructure/repositorys/storage_repository.dart';
import 'package:async/async.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final storageServiceProvider = Provider((ref) =>
    StorageService(storegeRepository: ref.read(storegeRepositoryProvider)));

class StorageService {
  StorageService({required storegeRepository})
      : _storegeRepository = storegeRepository,
        super();

  final StoregeRepository _storegeRepository;

  Future<Result<String>> uploadImage(File file) async {
    final result = await _storegeRepository.uploadImage(file);
    return result;
  }
}
