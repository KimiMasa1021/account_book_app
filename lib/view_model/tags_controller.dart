import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

final tagsControllerProvider =
    StateNotifierProvider<TagsController, List>((ref) => TagsController(ref));

class TagsController extends StateNotifier<List> {
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
            // return Tags(
            //   id: tags[i]['id'],
            //   tag: tags[i]['tag'],
            // );
          },
        );
      },
    );
  }

  final List<String> tagList = [
    "通信費",
    "光熱費",
    "食費",
    "お菓子",
    "課金",
    "ジュース",
    "外食を控えた！",
    "被服費・美容費",
    "娯楽費抑える",
    "交通費",
    "自炊した",
    "コンビニ",
    "節水した！",
    "電気代節約",
    "ショッピング割引",
    "施設利用",
    "ポイント還元",
    "家電省エネ",
    "不用品売った",
    "インターネット見直し",
    "自転車利用",
    "飲み物持参",
    "不用品リサイクル",
    "おやつ持参",
    "洗濯量減らす",
    "キャッシュバック活用",
    "エコバッグ持参",
    "家庭菜園",
    "シェアリング利用",
    "業務スーパー利用",
    "セール品活用",
    "飲料水持参",
    "フリマアプリ利用",
  ];

  Future<void> insertTags(
    List<String> tags,
    Function() fucntion,
  ) async {
    await database.transaction((txn) async {
      for (var tag in tags) {
        await txn.rawInsert('INSERT INTO tags(tag) VALUES("$tag")');
      }
    });
    fucntion();
  }

  // Future<void> getTags() async {
  //   final Database db = database;
  //   final List<Map<String, dynamic>> tags = await db.query('tags');
  //   state = List.generate(
  //     tags.length,
  //     (i) {
  //       return Tags(
  //         id: tags[i]['id'],
  //         tag: tags[i]['tag'],
  //       );
  //     },
  //   );
  // }

  // Future<void> sortTags(List<Tags> newTagList) async {
  //   final nameList = newTagList.map((e) => e.tag).toList();

  //   await database.transaction((txn) async {
  //     await txn.rawInsert('DELETE FROM tags');
  //     for (var tag in nameList) {
  //       await txn.rawInsert('INSERT INTO tags(tag) VALUES("$tag")');
  //     }
  //   });
  //   await getTags();
  // }

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

  void shwoToast(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      textColor: const Color.fromARGB(255, 255, 255, 255),
      fontSize: 16.0,
    );
  }
}
