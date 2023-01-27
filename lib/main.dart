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

/* 
フレンド追加(検索)
詳細ページの右側



フレンド申請
ブロックリスト
*/
