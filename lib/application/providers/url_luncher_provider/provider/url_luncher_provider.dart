import 'package:account_book_app/application/providers/url_luncher_provider/notifier/url_luncher_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final urlLuncherProvider = StateNotifierProvider(
  (ref) => UrlLuncherNotifier(),
);
