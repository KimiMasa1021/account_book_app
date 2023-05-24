import 'package:account_book_app/application/providers/theme_provider/provider/tags_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  final themeModeKey = prefs.getInt("theme_key");
  runApp(
    ProviderScope(
      overrides: [
        themeProvider.overrideWithProvider(themeFamilyProvider(themeModeKey))
      ],
      child: const MyApp(),
    ),
  );
}

// TODO

/*
  QRスキャンの読み取り判定
  統計ページのローディング
  言語の設定
  RiverpodのoverrideWithProvider非推奨対応
  機能追加
  広告張り
  
 */

// DDD構成

// ├── lib
// │   └── common
// │      └── constants/theme.dart    // テーマ設定
// │      └── helpers/helpers.dart    // staticな関数の置き場 
// │   └── domain                         // Domain層
// │      └── **
// │         └── models                      // Model層 (型を定義する)
// │         └── ~_repository.dart           // 外部DBとの接続部 DBへの永続化などを担うレイヤー
// │         └── ~_service.dart              // repositoryの責務外のロジック
// │   └── pages                          // UI層 (画面を定義する)
// │      └── **/
// │         └── **_page.dart             // UIページ
// │         └── states/**_state.dart     // このページ内で使うstate
// │         └── (widgets)/               // このページ内に共通するWidget置き場
// │   └── widgets                        // 共通なWidget置き場
// │   └── di_container.dart              // DIコンテナ (Repository, Service, Notifierのインスタンスを生成)
// │   └── main.dart

/*

  Profile
  Saving
  Target

  
 */


// import 'dart:convert';
// import 'package:account_book_app/model/user/users_state.dart';
// import 'package:account_book_app/repository/friend_repository.dart';
// import 'package:account_book_app/view_model/users_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:http/http.dart' as http;

// final friendsControllerProvider =
//     StateNotifierProvider<FriendController, List<UsersState>>(
//         (ref) => FriendController(ref));

// class FriendController extends StateNotifier<List<UsersState>> {
//   final Ref ref;

//   final flavorName = const String.fromEnvironment('flavor');

//   //本番用
//   final String baseUrl =
//       "https://asia-northeast1-group-saving-app.cloudfunctions.net";

//   //デバッグ用
//   final String debugUrl =
//       "https://asia-northeast1-account-book-app-dev.cloudfunctions.net";

//   final headers = {'content-type': 'application/json'};

//   FriendController(this.ref) : super([]) {
//     ref.read(friendRepositoryProvider).feachFriends().listen((data) {
//       state = data.map((doc) => doc.data()).toList();
//     });
//   }

//   Uri requestUrl(String endpoint) {
//     if (flavorName == "dev") {
//       return Uri.parse('$debugUrl$endpoint');
//     } else {
//       return Uri.parse('$baseUrl$endpoint');
//     }
//   }

//   //検索でのフレンド承認
//   //  いつかアップデートでLINEみたいな機能実装しようかな
//   Future<void> qrFriendRequest(String uid) async {
//     final myUid = ref.read(usersControllerProvider)!.uid;
//     final friens = ref.read(usersControllerProvider)!.friends;

//     if (friens.contains(uid)) {
//       return shwoToast("既にに登録済みです");
//     }
//     const endpoint = '/qrFriendRequest';
//     final url = requestUrl(endpoint);
//     final sendJSON = {
//       "process": "QRフレンドリクエスト",
//       "user1": {"uid": myUid},
//       "user2": {"uid": uid}
//     };
//     final String body = json.encode(sendJSON);
//     await http.post(url, headers: headers, body: body);
//     shwoToast("フレンド登録が完了しました！");
//   }

//   void shwoToast(String msg) {
//     Fluttertoast.showToast(
//       msg: msg,
//       toastLength: Toast.LENGTH_LONG,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 1,
//       backgroundColor: const Color.fromARGB(255, 0, 0, 0),
//       textColor: const Color.fromARGB(255, 255, 255, 255),
//       fontSize: 16.0,
//     );
//   }
// }
