import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:account_book_app/model/genre.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../model/genre_state.dart';
import '../provider/firebase_auth_provider.dart';
import '../provider/general_provider.dart';

final genreRepositoryProvider = Provider((ref) => GenreRepositoryImple(ref));

abstract class GenreRepository {
  Future<void> deleteIncome(String docId);
  Future<void> deleteExpend(String docId);
  Future<GenreState> loadJsonAsset();
  Future<void> addGenre(String text, bool flg);
}

class GenreRepositoryImple implements GenreRepository {
  final Ref ref;
  final String path = "assets/json/genre.json";
  User? user;

  GenreRepositoryImple(this.ref) {
    user = ref.read(firebaseAuthProvider).currentUser;
  }

  @override
  Future<void> deleteIncome(String docId) async {
    try {} on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }

  @override
  Future<void> deleteExpend(String docId) async {
    try {} on FirebaseAuthException catch (e) {
      debugPrint(e.code);
    }
  }

  @override
  Future<GenreState> loadJsonAsset() async {
    String loadData = await rootBundle.loadString(path);

    final model =
        GenreState.fromJson(jsonDecode(loadData) as Map<String, dynamic>);
    return model;
  }

  @override
  Future<void> addGenre(String text, bool flg) async {
    final genre = ref.read(genreControllerProvider);
    final jsonFile = File(path);
    String loadData = await rootBundle.loadString(path);

    // final json = jsonDecode(genre.toString());
    final json = jsonDecode(loadData);

    if (flg) {
      int maxSeq = genre.expend.map((e) => e.seq).reduce(max) + 1;

      final newGenre = [
        ...genre.expend,
        Genre(
          name: text,
          seq: maxSeq,
        ),
      ];
      json['expend'] = newGenre;
    }
    // final jsonFile = File(path);
    await jsonFile.writeAsString(jsonEncode(json));
  }
}
