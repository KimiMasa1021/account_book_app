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
        return "https://www.youtube.com/";
      case WebViewType.aboutApp:
        return "https://pub.dev/packages/webview_flutter/example";
      case WebViewType.appHint:
        return "https://golden-carriage-07f.notion.site/dd3dafa896694577a4611cfd8cd2de0d";
      default:
        return "https://www.youtube.com/";
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
