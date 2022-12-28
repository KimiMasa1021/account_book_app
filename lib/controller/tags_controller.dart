import 'package:account_book_app/model/tags_state.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:collection/collection.dart';
import 'package:path/path.dart';

class TagsController extends StateNotifier<List<Tags>> {
  final Ref ref;
  late Database database;

  TagsController(this.ref) : super([]) {
    Future(() async {
      String path = join(await getDatabasesPath(), 'tags.db');
      database = await openDatabase(
        path,
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE tags(id INTEGER PRIMARY KEY AUTOINCREMENT, tag TEXT)",
          );
        },
        version: 1,
      );
      final Database db = database;
      final List<Map<String, dynamic>> tags = await db.query('tags');
      state = List.generate(tags.length, (i) {
        return Tags(
          id: tags[i]['id'],
          tag: tags[i]['tag'],
        );
      });
    });
  }
  Future<void> insertTags() async {
    await database.transaction((txn) async {
      await txn.rawInsert('INSERT INTO tags(tag) VALUES("たばこ")');
      await txn.rawInsert('INSERT INTO tags(tag) VALUES("酒")');
      await txn.rawInsert('INSERT INTO tags(tag) VALUES("お菓子")');
      await txn.rawInsert('INSERT INTO tags(tag) VALUES("課金")');
    });
  }

  Future<void> getTags() async {
    final Database db = database;
    final List<Map<String, dynamic>> tags = await db.query('tags');
    state = List.generate(tags.length, (i) {
      return Tags(
        id: tags[i]['id'],
        tag: tags[i]['tag'],
      );
    });
  }
}
