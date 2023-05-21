import 'package:account_book_app/application/providers/setting_provider/notifier/setting_notifier.dart';
import 'package:account_book_app/application/services/profile_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final settingProvider = StateNotifierProvider(
  (ref) => SettingNotifier(
    profileService: ref.read(profileServiceProvider),
  ),
);
