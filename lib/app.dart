import 'package:flutter/material.dart';

import 'view/pages/account/account_add.dart';
import 'view/pages/saving/saving_add.dart';
import 'view/separate.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: Separate.id,
      routes: <String, WidgetBuilder>{
        Separate.id: (BuildContext context) => const Separate(),
        AccountAdd.id: (BuildContext context) => const AccountAdd(),
        SavingAdd.id: (BuildContext context) => const SavingAdd(),
      },
    );
  }
}
