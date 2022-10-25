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


//feedback
//   円グラフの色分けはどうにかしないと
//   目標　最終目標金額　月々節約したい金額も設定して　ホーム画面で達成率を表示して可視化する
//   グループ機能もできたら実装したい