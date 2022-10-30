import 'package:account_book_app/view/pages/setting/friend_add_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'view/pages/account/account_add.dart';
import 'view/pages/account/account_genre.dart';
import 'view/pages/account/account_genre_add.dart';
import 'view/pages/saving/saving_add.dart';
import 'view/pages/saving/saving_history.dart';
import 'view/pages/setting/friend_add_qr.dart';
import 'view/root_page.dart';
import 'view/separate.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
        FriendAddQr.id: (BuildContext context) => const FriendAddQr(),
        FriendAddScan.id: (BuildContext context) => FriendAddScan(),
      },
    );
  }
}
