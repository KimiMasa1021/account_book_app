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
  統計ページのローディング
  言語の設定
  RiverpodのoverrideWithProvider非推奨対応
  広告張り
   */
