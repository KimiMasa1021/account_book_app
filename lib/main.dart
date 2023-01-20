import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app.dart';
import 'provider/general_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ProviderScope(
      overrides: [
        themeControllerProvider
            .overrideWithProvider(themeControllerProviderFamily(null))
      ],
      child: const MyApp(),
    ),
  );
}
