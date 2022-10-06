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

// TODO
// お母さんレポート
//　　追加画面のフォーカスは自動で移動したほうがいいっぽい
//　　円グラフ重要性　低い　文字サイズ大きくして見やすくしたほうがいいかも