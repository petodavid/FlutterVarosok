import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewBody extends StatelessWidget {
  String html;
  WebViewBody({@required this.html});
  WebViewController _controller;
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: Uri.dataFromString(html, mimeType: 'text/html').toString(),
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller = webViewController;
      },
    );
  }
}
