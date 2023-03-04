import 'package:account_book_app/model/saving/tags_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

final tagsControllerProvider =
    StateNotifierProvider<TagsController, List<Tags>>(
        (ref) => TagsController(ref));

class TagsController extends StateNotifier<List<Tags>> {
  final Ref ref;
  late Database database;

  TagsController(this.ref) : super([]) {
    Future(
      () async {
        String path = p.join(await getDatabasesPath(), 'tags.db');
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
        state = List.generate(
          tags.length,
          (i) {
            return Tags(
              id: tags[i]['id'],
              tag: tags[i]['tag'],
            );
          },
        );
      },
    );
  }
  final List<String> tagList = [
    "お菓子",
    "課金",
    "ジュース",
    "食費",
    "たばこ",
    "酒",
    "外食費",
    "日用品",
    "被服費・美容費",
    "娯楽",
    "交通費",
    "自炊した",
    "コンビニ",
  ];
  Future<void> insertTags() async {
    await database.transaction((txn) async {
      for (var tag in tagList) {
        await txn.rawInsert('INSERT INTO tags(tag) VALUES("$tag")');
      }
    });
  }

  Future<void> getTags() async {
    final Database db = database;
    final List<Map<String, dynamic>> tags = await db.query('tags');
    state = List.generate(
      tags.length,
      (i) {
        return Tags(
          id: tags[i]['id'],
          tag: tags[i]['tag'],
        );
      },
    );
  }

  Future<void> sortTags(List<Tags> newTagList) async {
    final nameList = newTagList.map((e) => e.tag).toList();

    await database.transaction((txn) async {
      await txn.rawInsert('DELETE FROM tags');
      for (var tag in nameList) {
        await txn.rawInsert('INSERT INTO tags(tag) VALUES("$tag")');
      }
    });
    await getTags();
  }

  Future<void> createTag(String tag) async {
    await database.transaction((txn) async {
      await txn.rawInsert('INSERT INTO tags(tag) VALUES("$tag")');
    });
  }

  Future<void> updateTag(String tag, int id) async {
    await database.transaction((txn) async {
      await txn.rawInsert('UPDATE tags SET tag = "$tag" WHERE id = $id');
    });
  }

  Future<void> deleteTag(int id) async {
    await database.transaction((txn) async {
      await txn.rawInsert('DELETE FROM tags WHERE id = $id');
    });
  }
}
