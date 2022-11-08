import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

//  targetStateの並び替え
//  targetStateからの脱退
//  家計簿円グラフの配色の設定
//  家計簿ジャンルをjsonファイルに保存する
//  ログアウト
//  QR表示　読み取り画面のUI修正
//  
// 
// 
// 
// 
// 
// 