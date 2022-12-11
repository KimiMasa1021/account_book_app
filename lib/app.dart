import 'package:account_book_app/view/pages/saving/saving_init.dart';
import 'package:account_book_app/view/pages/saving/saving_member_add_2.dart';
import 'package:account_book_app/view/pages/setting/friend_add_scan.dart';
import 'package:account_book_app/view/pages/setting/friends_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'view/pages/account/account_add.dart';
import 'view/pages/account/account_genre.dart';
import 'view/pages/account/account_genre_add.dart';
import 'view/pages/saving/saving_add.dart';
import 'view/pages/saving/saving_history.dart';
import 'view/pages/saving/saving_member_add.dart';
import 'view/root_page.dart';
import 'view/separate.dart';
import 'view/theme/app_theme.dart';

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final themeMode = ref.watch(appThemeModeProvider);
    return MaterialApp(
      theme: theme.data,
      darkTheme: AppTheme.dark().data,
      themeMode: themeMode,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: Separate.id,
      routes: <String, WidgetBuilder>{
        Separate.id: (BuildContext context) => const Separate(),
        AccountAdd.id: (BuildContext context) => const AccountAdd(),
        SavingAdd.id: (BuildContext context) => const SavingAdd(),
        SavingHistory.id: (BuildContext context) => const SavingHistory(),
        AccountGenre.id: (BuildContext context) => const AccountGenre(),
        AccountGenreAdd.id: (BuildContext context) => const AccountGenreAdd(),
        RootPage.id: (BuildContext context) => RootPage(),
        FriendAddScan.id: (BuildContext context) => FriendAddScan(),
        FriendsList.id: (BuildContext context) => const FriendsList(),
        SavingMemberAdd.id: (BuildContext context) => const SavingMemberAdd(),
        SavingInit.id: (BuildContext context) => const SavingInit(),
        SavingMemberAdd2.id: (BuildContext context) => const SavingMemberAdd2(),
      },
    );
  }
}
