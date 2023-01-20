import 'package:account_book_app/provider/route/router_provider.dart';
import 'package:account_book_app/view/theme/my_theme_mode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'view_model/theme_controller.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mode = ref.watch(themeControllerProvider);

    return MaterialApp.router(
      routeInformationProvider:
          ref.watch(routerProvider).routeInformationProvider,
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
      theme: mode.themeData,
      // darkTheme: AppTheme.dark().data,
      themeMode: ThemeMode.light,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}
//GoRouter.of(context).push('/tab'); // スタックで操作する場合
// GoRouter.of(context).go('/tab'); // 現ルートと入れ替える場合
// context.go('/tab'); // 現ルートと入れ替える場合