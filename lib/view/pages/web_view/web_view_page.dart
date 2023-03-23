import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
        return "https://app-dev.boo.jp/2023/03/23/%e5%85%b1%e5%90%8c%e8%b2%af%e9%87%91%e7%ae%b1-savegy%e3%82%b5%e3%83%99%e3%82%b8%e3%83%bc/";
      default:
        return "https://app-dev.boo.jp/2023/03/23/%e5%85%b1%e5%90%8c%e8%b2%af%e9%87%91%e7%ae%b1-savegy%e3%82%b5%e3%83%99%e3%82%b8%e3%83%bc/";
    }
  }
}

// ignore: must_be_immutable
class WebViewPage extends StatelessWidget {
  WebViewPage({
    super.key,
    required this.type,
  }) {
    pageTitle(type);
  }
  final WebViewType type;
  late String title;

  void pageTitle(WebViewType type) {
    switch (type) {
      case WebViewType.privacyPolicy:
        title = "プライバシーポリシー";
        break;
      case WebViewType.aboutApp:
        title = "このアプリについて";
        break;
      case WebViewType.appHint:
        title = "使用上のヒント";
        break;
      default:
        title = "エラーページ";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(type.url));
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: WebViewWidget(controller: controller),
    );
  }
}
