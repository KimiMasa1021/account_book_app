import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/genre_state.dart';
import '../repository/genre_repository.dart';

class GenreController extends StateNotifier<GenreState> {
  final Ref ref;
  GenreController(this.ref) : super(GenreState()) {
    Future(
      () async {
        state = await ref.read(genreRepositoryProvider).loadJsonAsset();
        debugPrint(state.toString());
      },
    );
  }

  Future<void> addGenre(String text, bool flg) async {
    await ref.read(genreRepositoryProvider).addGenre(text, flg);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
