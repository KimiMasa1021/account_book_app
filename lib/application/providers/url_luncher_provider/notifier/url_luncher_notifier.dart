import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

enum WebViewType {
  privacyPolicy,
  appHint,
  aboutApp,
}

extension ExWebViewType on WebViewType {
  String get url {
    switch (this) {
      case WebViewType.privacyPolicy:
        return "https://app-dev.boo.jp/2023/03/22/%e3%83%97%e3%83%a9%e3%82%a4%e3%83%90%e3%82%b7%e3%83%bc%e3%83%9d%e3%83%aa%e3%82%b7%e3%83%bc/";
      case WebViewType.aboutApp:
        return "https://app-dev.boo.jp/2023/03/23/%e5%85%b1%e5%90%8c%e8%b2%af%e9%87%91%e7%ae%b1-savegy%e3%82%b5%e3%83%99%e3%82%b8%e3%83%bc/";
      case WebViewType.appHint:
        return "http://app-dev.boo.jp/2023/03/26/%e4%bd%bf%e7%94%a8%e4%b8%8a%e3%81%ae%e3%83%92%e3%83%b3%e3%83%88/";
      default:
        return "https://app-dev.boo.jp/2023/03/23/%e5%85%b1%e5%90%8c%e8%b2%af%e9%87%91%e7%ae%b1-savegy%e3%82%b5%e3%83%99%e3%82%b8%e3%83%bc/";
    }
  }
}

class UrlLuncherNotifier extends StateNotifier {
  UrlLuncherNotifier() : super(null);

  Future<void> openUrl() async {
    final flg = await launchUrl(Uri.parse(WebViewType.appHint.url));

    if (!flg) {
      throw Exception('Could not launch');
    }
  }
}
