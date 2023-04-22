import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'app.dart';
import 'view_model/theme_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  final themeModeKey = prefs.getInt(ThemeController.key);
  runApp(
    ProviderScope(
      overrides: [
        themeControllerProvider
            .overrideWithProvider(themeControllerProviderFamily(themeModeKey))
      ],
      child: const MyApp(),
    ),
  );
}

// TODO

/*

  MVVMからDDDへの移行
  AsyncValueあたりのコード汚すぎる
  GoRouterあたりのコード汚すぎる
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


