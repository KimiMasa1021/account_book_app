import 'package:account_book_app/provider/route/routes.dart';
import 'package:account_book_app/view/component/shadow_button.dart';
import 'package:account_book_app/view/pages/login/widget/login_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../utility/web_url.dart';
import '../../../view_model/auth_controller.dart';
import '../../../view_model/tags_controller.dart';
import '../../theme/app_text_theme.dart';

class Login extends HookConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authCTL = ref.watch(authControllerProvider.notifier);
    final tags = ref.watch(tagsControllerProvider);
    final tagsCTL = ref.watch(tagsControllerProvider.notifier);
    final flg = useState(false);
    final size = MediaQuery.of(context).size;
    final font = ref.watch(myTextTheme);

    return Scaffold(
      body: Stack(
        children: [],
      ),
    );
  }
}
