import 'package:account_book_app/application/services/profile_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../presentation/widgets/common/lottie_dialog.dart';

class SettingNotifier extends StateNotifier {
  SettingNotifier({
    required ProfileService profileService,
  })  : _profileService = profileService,
        super(null);

  final ProfileService _profileService;

  Future<void> showLogoutDialog(
    BuildContext context,
    Function() navToAuth,
  ) async {
    await showDialog(
      context: context,
      builder: (context) => LottieDialog(
        url: "assets/json/logout.json",
        title: "ログアウト",
        subTitle: "ログアウトしますか？",
        button1Title: "ログアウト",
        onTap1: () async {
          await _profileService.signOut();
          navToAuth();
        },
        onTap2: () => context.pop(),
      ),
    );
  }
}
