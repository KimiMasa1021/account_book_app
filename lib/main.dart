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
//  曜日もつけたほうがいい
//  曜日別に色分け
//  topPageのジャンル別に段落を付ける
//  カレンダーの色分け
//    textInputAction: TextInputAction.done

//　ジャンルの保存方法の変更　順番の変更　削除
