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


「みんなで実現する、目標達成への近道」
「一緒に貯めて、一緒に達成する。」
「節約は、続けることが大切。みんなで継続しましょう。」
「今日の節約が、明日の実現に繋がる。」
「目標に向かって、節約のチカラを合わせよう。」
「仲間と共に、より楽しく節約ライフを送ろう。」
「日々の小さな節約が、大きな目標達成への一歩。」
「節約を楽しむことで、目標達成への意欲も高まる。」
「目標を決めて、仲間と共に節約の記録を共有しよう。」
「日々の節約が、実現したい夢や目標を叶えるカギ。」

「一緒に節約」
「コツコツ節約」
「節約の集い」
「Savings Squad（セービングスクワッド）」
「共同節約」
「目標節約」
「節約コンパニオン」
「貯めよう！共同節約アプリ」
「GoalSaver（ゴールセイバー）」
「マネーコントロール」
*/
