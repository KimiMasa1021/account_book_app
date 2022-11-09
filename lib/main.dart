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

//  targetStateからの脱退
//  家計簿円グラフの配色の設定
//  家計簿ジャンルをjsonファイルに保存する
//  

//////////
///targetStateの仕様
/// メンバーの追加はそれぞれのフレンドなら誰でも可
/// メンバーの削除は不可　自ら脱退するしかない
/// targetStateの削除はしない