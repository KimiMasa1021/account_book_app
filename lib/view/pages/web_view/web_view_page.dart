import 'dart:async';
import 'package:account_book_app/model/enums.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class WebViewPage extends StatelessWidget {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  WebViewPage({
    super.key,
    required this.type,
  }) {
    pageUrl(type);
    pageTitle(type);
  }
  final WebViewType type;

  late String url;
  late String title;

  void pageUrl(WebViewType type) {
    switch (type) {
      case WebViewType.privacyPolicy:
        url = "https://www.youtube.com/";
        break;
      case WebViewType.aboutApp:
        url = "https://pub.dev/packages/webview_flutter/example";
        break;
      case WebViewType.appHint:
        url =
            "https://golden-carriage-07f.notion.site/dd3dafa896694577a4611cfd8cd2de0d";
        break;

      default:
        url = "https://www.youtube.com/";
        break;
    }
  }

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
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        children: [
          // Expanded(
          //   child: WebViewWidget(
          //     initialUrl: url,
          //     javascriptMode: JavascriptMode.unrestricted,
          //     onWebViewCreated: _controller.complete,
          //   ),
          // )
        ],
      ),
    );
  }
}
